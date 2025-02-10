Received: from out203-205-221-164.mail.qq.com (out203-205-221-164.mail.qq.com [203.205.221.164])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05CDA256C8D
	for <rust-for-linux@vger.kernel.org>; Mon, 10 Feb 2025 16:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.164
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739206525; cv=none; b=slF7bqK8tavIRFSMhUGzHdh16BsoVo7othQfmIcccMPDjD4fwJ2HgiSLrNyHUG5CSczsl++Uv9KAEeGd9feymgizP6chkE4ywFYMZHz9hk1ZDRtQjjNdXQFir8wxlQOw6tpJN71LRvIJxMM7R94Q5Po5BG1llvUWwmHk/PJE3Dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739206525; c=relaxed/simple;
	bh=TP90k1x1cBy8D1aJkhJH0QPsRcBZnpgfJFvvkQzTQOM=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SjkWybVhxcg/Nfdli7asAzL7il62vt6AcnrBOg2lkPfiIQdbxEPHBusZjUI89LuR3MmQStMhOk8o/bDfbBKKr0Jzh1aEKqHQPDayEYyCHxPOmLPJzADF6hKLkOpNDNV1pQb1B5dhlVG2j1fkRifOdQ+lgsFUJZt/Wgf9TWJQ6k8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=JKLA9C2m; arc=none smtp.client-ip=203.205.221.164
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="JKLA9C2m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1739206514; bh=8d9K5lPvc7L+i4b6UhUlBCI6/XxdJFkbw66rtYM4WZE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=JKLA9C2mAwTa6p3ofcZFqnl6W+uBxdSZaVG19897Xcy1OPw0jklaazX/GD7kIokrT
	 svCsQyEBKjx+iwWgGjnfkcMX/W+N/Y2fO5xFCQ33fBUQ7O9nlhaBXC+HWSDcyOl4qx
	 UXDf4mtphs0zGseSDwP6rzJNSbWY8wdWFCOx5MEA=
Received: from jckeep-Lenovo-XiaoXinAir-14IIL-2020.. ([2408:8459:d0f0:fd1e:ebd2:62cc:a175:168d])
	by newxmesmtplogicsvrszgpua8-1.qq.com (NewEsmtp) with SMTP
	id A7BBA0F5; Tue, 11 Feb 2025 00:41:59 +0800
X-QQ-mid: xmsmtpt1739205719tkgqfxfnm
Message-ID: <tencent_EFD0399A6FA413B4B3597F93965D966BE40A@qq.com>
X-QQ-XMAILINFO: NDgMZBR9sMmabCzCDGtcEQkxaRp9S+8DBHe2yJxUYT3KxtPaHmTe00vGR/6+c3
	 HA8sqKCngJDNWyIgDg/SxnsOh/n/tUpYDTuTQkbxFOtrRiLaT/e6yA7DIRz9mhPnB7gQHd+Qp1Gy
	 aM81YuJ5mWZNgwKnOiHxyMQkcSsxJnvST7PtqLwHxSi+yggYRr3JJh4G/zRGo97ILhzrUmaaTon0
	 gl5A47EUzDFeie/NVODSu5lFdyaZkjFaSa3ueILQ4hKMiVsC37Yx3RyKlHZUPc4qiCn1NzpTybNP
	 7T8Vjf75TzEjMYyjczzCbH6aaFtgKq/6Y6UntWK1EzVizQDJOBWwAcsqXH6juMYXjcmVFUJ4IC8V
	 qpN3kchyz917m03OGU4wlo8xQAe3EZnp0nh/pEEmY17QG73dHPifA3Qouzpdhi8+8c7gg4TeeS8N
	 y/PcwtMqKLcdhX5rjw0h3RiE2K2t9Wm2qv2zU4cMDg99sUmpxYsY8xHeGxNzyVJtDR8egje1Qamw
	 ivKqEgBemN4VJ4ZTFpsnXPErRfxC9uPwNiNo7jtV0nyx5V9/5SOaiYZQKkLiKFTpcfsqXVAM/9um
	 Nsh/6os9/lSXdW9voSrHvfsS7tazrR73uQYag1i38Pdsc9dGxBk9/3X+us4E5qt8ycVKFTAOaU09
	 CX5T6vT1ZmhsXZo0LngAG/IR/AuDWIp9A9ye4AKW0N2Z34hsjRx+vs7oJf2BLwFFLpr2WP1O82A+
	 oG4dOh3N1ujwxIJDia4yZBPOcJFRZJooDBpIpcp5tgNmka9eNr6ggJbRMGkUuumdCzi1FEBFhhQJ
	 EuHDL6IjLpjbKdWgqG6NaQuCF+xMipuyqfQKVhlCgtagVpR3P9ZPhJRq2zwAHUynmz2aDKPgfNXW
	 QjD1fF4RarG/jcbUbsW3pEIwpJ2YmSm+jtOFSFrlEoOT8w4394xKdSHc3H7zDQ9sKSQeMgGR3c6D
	 d07KdMXcaorKsv+g4qVtac0Ncye6gr
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
From: Guangbo Cui <2407018371@qq.com>
To: daniel.almeida@collabora.com
Cc: a.hindborg@kernel.org,
	alex.gaynor@gmail.com,
	aliceryhl@google.com,
	benno.lossin@proton.me,
	bjorn3_gh@protonmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	linux-kernel@vger.kernel.org,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org,
	tmgross@umich.edu,
	dakr@kernel.org
Subject: Re: [PATCH v2] rust: irq: add support for request_irq()
Date: Tue, 11 Feb 2025 00:41:59 +0800
X-OQ-MSGID: <20250210164159.370273-1-2407018371@qq.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <D058ABBE-A0E8-4D95-AA4F-31EAA4092A73@collabora.com>
References: <D058ABBE-A0E8-4D95-AA4F-31EAA4092A73@collabora.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

> By the way, I wonder if a re-export would be beneficial? I find it a bit tedious to specify this path.
> 
> It also clashes with kernel::driver::Registration and kernel::driver::drm::Registration, so I find myself
> continuously writing an alias for it, i.e.:
> 
> ```
> Use kernel::irq::request::Registration as IrqRegistration;
> Use kernel::irq::request::Handler as IrqHandler;
> ```
> 
> Looking at mq.rs <http://mq.rs/>, I see Andreas did something similar:
> 
> ```
> pub use operations::Operations;
> pub use request::Request;
> pub use tag_set::TagSet;
> ```
> 
> Asking for opinions here since this is a bit cosmetic in nature. IMHO, at least the ‘request’ part of the path has to go.

Maybe the Rust subsystem should have a unified convention for this？
Re-export is both beneficial and necessary. The naming retains `Registration`
and `Handler` to be consistent with other modules. And accessing it with the
module prefix, such as `irq::Registration`. Just like @dakr did in `rust_driver_pci.rs` 
and `rust_driver_platform.rs`: `pci::Driver` & `platform::Driver`; `pci::Device` & `platform::Device`.

Hope this help, if not, ignore it.

Best regards,
Guangbo Cui

