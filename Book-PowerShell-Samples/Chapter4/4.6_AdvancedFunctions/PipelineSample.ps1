function PipelineSample {
  begin {
    Write-Output "begin : $_"
  }

  process {
    Write-Output "process : $_"
  }

  end {
    Write-Output "end : $_"
  }
}

function ParameterSample {
  param([int[]]$Item)
  begin {
    Write-Output "begin : $item"
  }

  process {
    Write-Output "process : $item"
  }

  end {
    Write-Output "end : $item"
  }
}