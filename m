Received: from out203-205-221-242.mail.qq.com (out203-205-221-242.mail.qq.com [203.205.221.242])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D750810F9
	for <rust-for-linux@vger.kernel.org>; Tue, 29 Oct 2024 14:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.242
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730213381; cv=none; b=UtxhOP/iysLwdhWccvLIIYl4op5tYN26v+RWnnUexCsY9FhDjv+WYocwRcTXGWJFUJMlonTXYYu9ts7zMl9mPNiWzLH/nh97emPO7r8wJdwKVHrzyufyR1vYN/cd0OsiJaHvX8YAd2RR++s/MhslC3LthXkwinLJJLZj7B2HirM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730213381; c=relaxed/simple;
	bh=yPGWJiCcGdf6AjHPwsZu5imN7/M9ND9eukLVBkThNzc=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pwo5MHshNRj3jmos6LNSfnhI5x/wHG+U3fj/lt+1WN4vIa0x4kopmwwO4Jsieaihira19JrTArmS2kAXV7xTFVjwVPfSnZMx/Q8PuREe0VdaNSYyqkU0D7cI2mO98741qYE0fVS5rDigIASAcNkhG8U6mhfU0aqrFyor88PF2bA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=gT3rttbh; arc=none smtp.client-ip=203.205.221.242
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="gT3rttbh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1730213367; bh=L/7CDkAcV/oC1KY39AMcI+6w+NrDvViIMNXe0vlEyI8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gT3rttbhftLCVmBqHdSdDaGjbYbhG0vdBIorBsjvisF77uEJNDpy/13pf6omz5bWn
	 t887bcF5Q9Iu7LrNntJnuPb+J5ujQKCeVHysH2Iu7oL8Y8QIEY8ng4skLThFRPEguv
	 3T+zIf9ouf9FGZlXMNkL5pBuBDcWd83GnBi9eTUQ=
Received: from jckeep-Lenovo-XiaoXinAir-14IIL-2020 ([124.240.55.158])
	by newxmesmtplogicsvrszb21-0.qq.com (NewEsmtp) with SMTP
	id C5895076; Tue, 29 Oct 2024 22:49:24 +0800
X-QQ-mid: xmsmtpt1730213364tjrud95qd
Message-ID: <tencent_7C6ADCD0399873A54FB5D75A0F911E5FBE0A@qq.com>
X-QQ-XMAILINFO: MQAOa38Yz/8/aaUfRXGy7q8BZ9kiK/Wpqj0Pu/nIMpFXVncVYzMcGvQv97ROA6
	 Fwz2vy3N4NQQWZVxJP7VoWdNl6oHbsUMOgBZgPsxNdyQCS/wVw/2bOiLMAUYW8tVocYjL7n9+rmg
	 gj33Tx0DZVzIqR//gHkq4HHKNLyW4irEBkHg2X8DYMm1IG549sm2tXCwku9vxW3CNhjm6THn6pph
	 QZHsLCV7QAOF4+/gZDuEW5Gy1Ye5iCDnEcDX7jY4Lgjg+8BobU1IUDS0lixLxCScmKrjUWdS0ayY
	 xcydwIIUOHoEcRWTYstmUgyADzi3HxAJw2vJgXhqpXeBo5DbV+bDiDYZwtr2JafrbWRLMoI3Ja8X
	 xc5/KHmSNbmHxsbLhT/a+2s+cH0WNoeNkFMKO4piLso0MYkprSVMfhtgEJHEBqCtkIiP5K+x6fdH
	 RhdAdCkVC4lu1YC4ICBnUSohyyxIaF0NeuBQqQfCyELXvDE/dYHre5qPxuHLfRYU1GbPOYuBn9Op
	 h+19RmIONMhqMvTzaWvGF2Lc2mVA9j8ShOd8jIRSRua4Av7f7XLKLyeKvqnovikuGa6oPpNqXWAw
	 4f1E6kpuNcnjthpWUq/APBWAgke+iqvAlchqh0qywn/byUR7d7jVVFvvI/yHxUIBmiiiWuF1ERRx
	 FnnsdUOmOTmjqzQwfKA1n/q5/2BuH/OlGol6owDIdG+EceiYAyviag+EnTg57y0OEH1PtPf4fytM
	 SY0hCoZzEopnQLJCzUQstSwZ9pcvN8SNeuF/HqkMljyH9s1Kpi3aNxj/BDmjKAtTsSqiOvknEQjo
	 tTsWBt8WBwMH7NKOywdk6twj3GPEUNgPBwnCurL+j7oZxnKB4uaImsJ9Tc4UQV+WYgyMNP+Hulg3
	 7p6PML9PAFSkF/q7zkMlNQU6iata41x4zNmL5UmYVpYzlVZCbDkP6Jy9rn+ZpN7K+cxwoJVvCoVD
	 Uup1zDZZQKsBn7J+iDl1kVA3AxXQwom8g9PBXgRXiUrPlyqgS1TOeR5+PfhuJwnWy6zZKHPWIU0a
	 gp48LDfK0BR3vi6YKoAV1FcdMf12g07DNqKv24KlOZEAkZZvwl
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
Date: Tue, 29 Oct 2024 22:49:24 +0800
From: Guangbo Cui <2407018371@qq.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	Bj??rn Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2] rust: Implement Display for Box
X-OQ-MSGID: <ZyDyZ9tkSGJcQPMu@jckeep-Lenovo-XiaoXinAir-14IIL-2020>
References: <tencent_F71CE9D125A8C6191D8CF95B3A4F3BB2F506@qq.com>
 <CANiq72nRLTCe+Q3J-b=u0Ho950+wEqreCLomnT-AyEryBmZoig@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72nRLTCe+Q3J-b=u0Ho950+wEqreCLomnT-AyEryBmZoig@mail.gmail.com>
X-FQ-mid: xmimza34-3t1730213109td29rbsyb
X-BQ-mid: xmimza34-3t1730213027t57jh0x0c
X-BQ-mid: xmimza34-3t1730212961t8cndd1wj
X-BQ-mid: xmimza34-3t1730212898t426l03fd
X-BQ-mid: xmimza34-3t1730212841tyyumkzmu

On Tue, Oct 29, 2024 at 01:01:33PM +0100, Miguel Ojeda wrote:
> On Tue, Oct 29, 2024 at 2:01 AM JCKeep <2407018371@qq.com> wrote:
> >
> > Signed-off-by: Guangbo Cui <2407018371@qq.com>
> 
> Thanks for changing the SoB -- note that there is no From: tag so it
> comes from the header, and that one is different, so checkpatch.pl
> warns about it:
> 
>     WARNING: From:/Signed-off-by: email name mismatch: 'From: JCKeep
> <2407018371@qq.com>' != 'Signed-off-by: Guangbo Cui
> <2407018371@qq.com>'
> 
> Did you use `git send-email` to send it?

Sorry, my configuration was wrong, will fix it in next version.

> 
> Cheers,
> Miguel

