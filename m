Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85F70168DB
	for <rust-for-linux@vger.kernel.org>; Mon,  6 Nov 2023 10:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="paz+T7Fu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B143CC433C7;
	Mon,  6 Nov 2023 10:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1699264932;
	bh=ls+bltstQXCuAGihnBywR+cEQgB/3yg5lKL+wMm8IdQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=paz+T7Fuw13z+knspl7vIopclwnj0Y+cJYhLlcNzxfiB4A1Qwm8eng+hMZHiWWtDi
	 41ln+WQeggHTSf8GHPHlzlmbQLbT0h7VstRGEaTQRW3BCvEgrbi6mbKI3W2tosJQCU
	 7fsiyO7FJtuJT+xHYaaRAFDX85cusCmYPvUCWblQ=
Date: Mon, 6 Nov 2023 11:02:08 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Steve Fan <stevefan1999@gmail.com>
Cc: rust-for-linux@vger.kernel.org
Subject: Re: Considering first class integration for Cargo
Message-ID: <2023110630-tusk-dusk-0381@gregkh>
References: <CAM0aA4MOzDx7HK5O6aYjJAqASKCkLm6mi=Z3fsr2-VSKO4KFdg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAM0aA4MOzDx7HK5O6aYjJAqASKCkLm6mi=Z3fsr2-VSKO4KFdg@mail.gmail.com>

On Mon, Nov 06, 2023 at 05:55:50PM +0800, Steve Fan wrote:
> Hello all,
> 
> Please consider supporting Cargo for pulling in external crates, as I
> got some no-std based data structure crates on crates.io.

What data structures do you need in the kernel that are not already
provided?

thanks,

greg k-h
