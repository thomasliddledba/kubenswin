# kubenswin

Windows Version of the powerful tool [kubens](https://github.com/ahmetb/kubectx)

```console
      Usage
        kubenswin                        : current namespace
        kubenswin ls                     : list the namespaces in the current context
        kubenswin set <name>             : switch to another namespace in the current context
        kubenswin help                   : display usage
```

## Also Try
* [kubectxwin](https://github.com/thomasliddledba/kubectxwin)

## Tests

| OS | Success |
| --- | --- |
| Windows 10 | Yes |
| Windows 2012 R2 | Yes |
| Windows 2016 | N/A |
| Windows 7 | N/A |
| Windows 2008 R2 | N/A |

>Note `N/A` = Haven't tested yet

## Prerequisites

* [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/#install-with-chocolatey-on-windows)
* [kubectxwin](https://github.com/thomasliddledba/kubectxwin)

### Chocolatey

You can install the kubectl client via [Chocolatey](http://chocolatey.org).  This is the recommended way based on the [kubernetes.io docs](https://kubernetes.io/docs/tasks/tools/install-kubectl/#install-with-chocolatey-on-windows).

```console
$ choco install kubernetes-cli
```

## Usage

```console
$ kubenswin ls
* default
kube-public
kube-system
sandbox

$ kubenswin set sandbox
Context "minikube" modified.
Active namespace is sandbox in context minikube

$ kubenswin
sandbox
```

## Installation

You will need to ensure you put `kubenswin.exe` in a directory in your $PATH.  To see what directories you can put it in use the following command.

In a Windows Command Prompt

```console
$ echo %PATH%
```

In a Powershell Command Prompt

```powershell
PS> Get-ChildItem Env:
```

## Things to Note

kubenswin for Windows is actually a powershell script that was converted using [`PS2EXE-GUI`](https://gallery.technet.microsoft.com/scriptcenter/PS2EXE-GUI-Convert-e7cb69d5).  I have saved the copy of PS2EXE-GUI that I used in this repo.

This allows users and developers to use different methods of kubenswin for Windows.  For example, if you want just to use the Powershell script or convert it to a PowerShell module, you can do that.  By default, I provide the `.exe` because that is useful to me.  However, feel free to use it anyway you like and please CONTRIBUTE with new features and funtionaility. 

## How to Contribute

I'd love for anyone to contribute.  Please read the [CONTRIBUTING.md](CONTRIBUTING.md) document for more information.

## How to compile

### Prerequisites to compile

* Windows 10 or higher
* [`PS2EXE-GUI`](https://gallery.technet.microsoft.com/scriptcenter/PS2EXE-GUI-Convert-e7cb69d5)
* Powershell 4.0 or higher (I used 5.0)

Open a Powershell command with `Run as administrator`

```powershell
$ git clone https://github.com/thomasliddledba/kubenswin.git <working directory>
$ cd <working directory>/kubenswin
$ ./PS2EXE-GUI/ps2exe.ps1 -inputfile kubenswin.ps1 -output bin/kubenswin.exe
```

# Thanks

* Markus Scholtes - [PS2EXE-GUI](https://gallery.technet.microsoft.com/scriptcenter/PS2EXE-GUI-Convert-e7cb69d5)
* Ingo Karstein - [PS2EXE](https://gallery.technet.microsoft.com/scriptcenter/PS2EXE-Convert-PowerShell-9e4e07f1)
* [Jon Mosco](https://github.com/jonmosco) - Late night discussion about doing this weekend project.  Check out [kube-ps1](https://github.com/jonmosco/kube-ps1) by Jon! Maybe a Windows version????
* Ahmet Alp Balkan - [kubectx](https://github.com/ahmetb/kubectx) - Writing the inital code for kubens and giving me the idea to extend to Windows for us Windows guys based on this [Issue #29](https://github.com/ahmetb/kubectx/issues/29)
