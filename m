Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BED0723DE80
	for <rust-for-linux@vger.kernel.org>; Wed, 12 Mar 2025 12:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741782041; cv=none; b=NTEE6o7PfwkvnyCJVISvCHlqjKtHJoai3LjjN4TLOMitGdJA5fhYg88t0XXW4IW8YmpP2F/Em1FRddL7ZOiEX01m5HSOyW+SOZArq62qlqeP5T7guE20LZWOPTRQbI5fEqWH1jBCsRx4YC9gA68rWu+OVS2kHBGnOEAS8D3RIlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741782041; c=relaxed/simple;
	bh=AmC3SA3wE1mhVtRdmWo0BMKWn8QMG93TxqvzmufdgG0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=E08DmKRNr7fVIZkgg9q3fDS05yaV8lddtdUJ4vKzW3jn4H7SeBant+6RgWItdsu+sd/4+pEal5zVcLF0hb0+c/3SZti6eqCQ8w+Vska+L10IKiLBA0ZgA2BQIiFaI0RwXvXO44CXTw9P7JMZT2ji4WK6gmFbDTAQDPXlziWrMjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net; spf=pass smtp.mailfrom=posteo.net; dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b=Y55lzv9w; arc=none smtp.client-ip=185.67.36.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b="Y55lzv9w"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 31D42240105
	for <rust-for-linux@vger.kernel.org>; Wed, 12 Mar 2025 13:20:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1741782037; bh=AmC3SA3wE1mhVtRdmWo0BMKWn8QMG93TxqvzmufdgG0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 From;
	b=Y55lzv9wnH2OGJgCpKOVywrEuk61ZuBZwW8wOHSAP8RKUkDp/vz9BCdemqR1YGjzP
	 U50v092TbmEXBrb0oPJHnqI2Ff2O7drBF5GlPmvCloQEa2O7Y8g8JMI44fv8SRS9AS
	 N5dOqLu5IVDWRiI5tIpAtWAhaIuw9jyBsuWEFBZm6JFs8eXsMRmoLrVvHHWa31YRqS
	 AfT3pmTQeqaQZKROrzuX9t7b9avEf//m9jHxyousrobnJuaxDTxhpajBV6Tb50YLiq
	 IE7hh4Wq+yJxts21SyVPeV9UHq8OpAXaVTNnFTTMUkyKqZNpa3texEYhAXCYS0XOn7
	 KUrnx0aQZmGiA==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4ZCV8F63mSz6v17;
	Wed, 12 Mar 2025 13:20:28 +0100 (CET)
From: Charalampos Mitrodimas <charmitro@posteo.net>
To: I Hsin Cheng <richard120310@gmail.com>
Cc: rostedt@goodmis.org,  paulmck@kernel.org,  frederic@kernel.org,
  neeraj.upadhyay@kernel.org,  joel@joelfernandes.org,
  josh@joshtriplett.org,  boqun.feng@gmail.com,  urezki@gmail.com,
  mathieu.desnoyers@efficios.com,  jiangshanlai@gmail.com,
  qiang.zhang1211@gmail.com,  ojeda@kernel.org,  alex.gaynor@gmail.com,
  gary@garyguo.net,  bjorn3_gh@protonmail.com,  benno.lossin@proton.me,
  a.hindborg@kernel.org,  aliceryhl@google.com,  tmgross@umich.edu,
  dakr@kernel.org,  rcu@vger.kernel.org,  rust-for-linux@vger.kernel.org,
  linux-kernel@vger.kernel.org,  skhan@linuxfoundation.org,
  jserv@ccns.ncku.edu.tw
Subject: Re: [PATCH] rust: sync: rcu: Mark Guard methods as inline
In-Reply-To: <20250312101723.149135-1-richard120310@gmail.com> (I. Hsin
	Cheng's message of "Wed, 12 Mar 2025 18:17:23 +0800")
References: <20250312101723.149135-1-richard120310@gmail.com>
Date: Wed, 12 Mar 2025 12:20:27 +0000
Message-ID: <m2h63ycues.fsf@Mac.home>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

I Hsin Cheng <richard120310@gmail.com> writes:

> Currenyly the implementation of "Guard" methods are basically wrappers

"Currenyly" -> "Currently".

> around rcu's function within kernel. Building the kernel with llvm
> 18.1.8 on x86_64 machine will generate the following symbols:
>
> $ nm vmlinux | grep ' _R'.*Guard | rustfilt
> ffffffff817b6c90 T <kernel::sync::rcu::Guard>::new
> ffffffff817b6cb0 T <kernel::sync::rcu::Guard>::unlock
> ffffffff817b6cd0 T <kernel::sync::rcu::Guard as core::ops::drop::Drop>::drop
> ffffffff817b6c90 T <kernel::sync::rcu::Guard as core::default::Default>::default
>
> These Rust symbols are basically wrappers around functions
> "rcu_read_lock" and "rcu_read_unlock". Marking them as inline can
> reduce the generation of these symbols, and saves the size of code
> generation for 100 bytes.
>
> $ ./scripts/bloat-o-meter vmlinux_old vmlinux_new
> add/remove: 0/8 grow/shrink: 0/0 up/down: 0/-100 (-100)
> Function                                     old     new   delta
> _RNvXs_NtNtCsaYBeKL739Xz_6kernel4sync3rcuNtB4_5GuardNtNtCsdaXADs8PRFB_4core7default7Default7default       9       -      -9
> _RNvXs0_NtNtCsaYBeKL739Xz_6kernel4sync3rcuNtB5_5GuardNtNtNtCsdaXADs8PRFB_4core3ops4drop4Drop4drop       9       -      -9
> _RNvMNtNtCsaYBeKL739Xz_6kernel4sync3rcuNtB2_5Guard6unlock       9       -      -9
> _RNvMNtNtCsaYBeKL739Xz_6kernel4sync3rcuNtB2_5Guard3new       9       -      -9
> __pfx__RNvXs_NtNtCsaYBeKL739Xz_6kernel4sync3rcuNtB4_5GuardNtNtCsdaXADs8PRFB_4core7default7Default7default      16       -     -16
> __pfx__RNvXs0_NtNtCsaYBeKL739Xz_6kernel4sync3rcuNtB5_5GuardNtNtNtCsdaXADs8PRFB_4core3ops4drop4Drop4drop      16       -     -16
> __pfx__RNvMNtNtCsaYBeKL739Xz_6kernel4sync3rcuNtB2_5Guard6unlock      16       -     -16
> __pfx__RNvMNtNtCsaYBeKL739Xz_6kernel4sync3rcuNtB2_5Guard3new      16       -     -16
> Total: Before=23385830, After=23385730, chg -0.00%
>
> Link: https://github.com/Rust-for-Linux/linux/issues/1145
> Signed-off-by: I Hsin Cheng <richard120310@gmail.com>

Reviewed-by: Charalampos Mitrodimas <charmitro@posteo.net>
