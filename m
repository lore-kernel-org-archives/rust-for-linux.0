Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B7E433CC4
	for <rust-for-linux@vger.kernel.org>; Fri, 29 Mar 2024 17:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.126.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711732434; cv=none; b=AGfIuAI49CfA3DeeTiZMCtXKuBAiuUhNZsFHniOIW+STOewHDB+Jl5dvzjIUFmeuG5a3ixml8CEd3YLaZ4LdnrlqBSlLIRU8JivnZp3gSrV3NI63BX8cF94yal8AZ87jPnzkg/FdlEJxMgCIpGBEnXvOH/k8y3F+8RDFbhEzPvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711732434; c=relaxed/simple;
	bh=U3b7RMrpXaA9ILIRAAAC9ZXtvgWtCjwRgvaHUS97qPI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cwmOkeunF+5SJht4iL7Z4X9xBcyxZElniqZK12gwZO/qgk0P3v/gAM9BD/mQQM5A2BfxeB9f72u6ZA7x5gIfQUTZ8JIBpMthLulLsezdYBKSUdODm4dHSQ9ZR0mcLMX4oVWhBQSp/wMwn1Zdjt40RCr1M7rf3Jrmrfgf4QbcBys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=valentinobst.de; spf=pass smtp.mailfrom=valentinobst.de; dkim=pass (2048-bit key) header.d=valentinobst.de header.i=kernel@valentinobst.de header.b=kR0IMCrQ; arc=none smtp.client-ip=212.227.126.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=valentinobst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valentinobst.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=valentinobst.de header.i=kernel@valentinobst.de header.b="kR0IMCrQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valentinobst.de;
	s=s1-ionos; t=1711732408; x=1712337208; i=kernel@valentinobst.de;
	bh=MZUcAVKsroZGqcwgQq+ZyqlyHS8sAEwCNCFZOktmTTY=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:
	 References;
	b=kR0IMCrQmweZzJKFstkUbQGmYI8r7SOkbIOq+6Mjwfm3TBNwUTFIaYm1817AygOc
	 EM8eopivkyuKFKeUR2VeDbuhhMdH7gE2c56lnHATo6Dv3zFTgxQszDjdWFLtacKAi
	 //EUzATddMy1/bJgfF5kXdzqa5aNr5Kkt7NX6mtMLYJkJp+c0mgxCBqvJ8PG4aRLN
	 hp5U/NP6SNrDNt0JKdv4U6mJ7937MDlkenuz/hyB+I+I7RSloHAmkO8s46pc3aPIm
	 wrfflCaS0hhRAT0EMnF6zrq0EDXpHtim2OU1+VCcivi636YqM9Vnsd/g6PbF8tVE9
	 ZAl7VeEEMn36gMkYLQ==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from archbook.fritz.box ([217.249.70.154]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MtwIW-1shwqJ3hwi-00uEYS; Fri, 29 Mar 2024 18:13:27 +0100
From: Valentin Obst <kernel@valentinobst.de>
To: laura.nao@collabora.com
Cc: a.hindborg@samsung.com,
	alex.gaynor@gmail.com,
	aliceryhl@google.com,
	benno.lossin@proton.me,
	bjorn3_gh@protonmail.com,
	boqun.feng@gmail.com,
	dirk.behme@de.bosch.com,
	gary@garyguo.net,
	kernel-linux@vger.kernel.org,
	kernel@collabora.com,
	kernel@valentinobst.de,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org,
	wedsonaf@gmail.com
Subject: Re: [PATCH] docs: rust: Add instructions for the Rust kselftest
Date: Fri, 29 Mar 2024 18:13:24 +0100
Message-ID: <20240329171324.5221-1-kernel@valentinobst.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240329153025.150112-1-laura.nao@collabora.com>
References: <20240329153025.150112-1-laura.nao@collabora.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Provags-ID: V03:K1:/n7wMP4+7fchYYCxKyoRdJQejlGSI0El8CscSH8fhY/vx0R0NJS
 VjDC0SjySfMZZ+TUDP0CcEX2mBsHZ0NraWy9py1JFMoUtVbpaqjn3zS2eYXc6Jq2lnLzEj8
 1w3UrYUK/0TNBergXDqh1QI2EGFjhb0AIktp2YTGT7rKaVyuAcgYnG92JKKJYQvzwg8vqCh
 Xt5dwKniIFitnqnbiWq2w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:1y5hxWR8Y9U=;S4huNPdp+lbze6Y7HJB0GJQOSVT
 KzvjKpp+YQyDzTRPp45uVgGVemTVg04GGNdu40gAAVRPzwdaBQrJ61OhIaMulqENfbtOn9VDW
 SlCSXEirKBNO9Pcc39Y4QOfNHBAKtYTqKJnKVpss49DM1vVFuimDm7gQwLSWyQbnqMq1jZK/P
 35xrwHFOYL41wYg8zhAXvIt13s/yln2vaetNwAnvEkFregrfsOuVbfgoKoHk2eohNWfiGZOab
 8vXBy3qeDGaobS2TUM/bOQFdOAn3cvDGhmwfsmqgD0wTkA6yI/jNfxM3moOeKw1ueparckYEU
 qhMQ6hFntQiAgrv0Ty7EnkGl3oxZShTK2PZyItiQxhgFCpR8aPiAgew64NQ7QZ01z3JjEWxYn
 xiMcOKh2Dh8T8k59g48jEm4i8RKe36dOcBi6i80BmnIl1mm0zUJHfT9vZaUq6VVDMAK3V7QOc
 +Kh+nPyCcJ9wM41Ny6IgSFnAv4iFtYrFxGGD6bRxuu9YmzYeqjOov+Ekjn8ZWImN9f5F7Y/F4
 gnPU+AIk/5rnAoF8n6CmpGJuc4U0+vm6Yd8t708rB9a5ocA+diT2ZW4eS8Nx4wcIlERrZ/mJJ
 qG1MMjFUldRyynveya2FiRsldUHfhHoRmjq8aV7Hm9tHunUN59dgYXwIFbxyTQBOeEyEkrqWU
 a0s0MoLns/WZpsRc7Orj+4gW3Hcg4xaGQU4Lt245cIfvxiuALzxwweR+OGRWQs0AjIBvo2XVg
 KgiY/Fqx1RZ3QYT1NE2MeHgdyy0F6nXcaLfzVrHZqn21xVDfGp6CIQ=

> +
> +The Kselftest
> +---------------------
> +
> +A Kselftest is also available, which verifies that the Rust sample modules
> +can be added and removed correctly.
> +
> +The kernel config options required for the test are listed in the
> +tools/testing/selftests/rust/config file and can be included with the aid
> +of the merge_config.sh script::
> +
> +	./scripts/kconfig/merge_config.sh .config tools/testing/selftests/rust/config
> +
> +To build and run the test, use::
> +
> +	make TARGETS="rust" kselftest
> +

In addition to what Miguel said, I think it would also be useful to
mention that kselftests are expected to be run (e.g. via the above
command) on a system that is _running_ the kernel to be tested.

I think its worth pointing that out since in that sense they are different
from the other tests on this page, for which the example command can be run
from the kernel tree on an arbitrary system. Of course that's all written
in the docs you linked, but I assume spelling it out here will avoid
confusion.

Apart from that it looks good to me.

    - Best Valentin

> +Refer to Documentation/dev-tools/kselftest.rst for the general Kselftest
> +documentation.
