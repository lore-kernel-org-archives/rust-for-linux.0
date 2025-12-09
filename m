Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 323A4258ECB
	for <rust-for-linux@vger.kernel.org>; Tue,  9 Dec 2025 10:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765277810; cv=none; b=IuWblkfWJ8Xazrg3LdZtFi3abOvpD4aWRd8rjoy4l6FgJJy+ztsBOlc9EkT4SxxrYUqLEwwr1lvG2xTNSgFEguJR8unlwhAMsHomnt/MccZvY5V6FSd2Wxzaxd49qPPQHbmdTQzhehvPDisnGjZN8zxaRVbrp4TuP7415838DO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765277810; c=relaxed/simple;
	bh=asy34GF/k7rwU26Lp+ifZwgVFrPkNZdWmRI8UBGyztE=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=p155SCd0+J0NThLfDNHLXb4lhVfeQMcQGMn+2FteEHzcocZRcWHx0sXkVoC9ep0Um159/8fkiqLjfz0dbrqv5TqBa0O7no1L10cU93yNS1PORzIE5mD3k5NQpbEyjIZsBOmshPnwbiUcYlwZnIjpzix0mCA9MTXousmmukRw86E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l9yPrsX+; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l9yPrsX+"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-297f5278e5cso9346395ad.3
        for <rust-for-linux@vger.kernel.org>; Tue, 09 Dec 2025 02:56:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765277808; x=1765882608; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Bwdcr6J6JkQ5MN9u9veUQ8APZTuYdOs+09yDTwCve4c=;
        b=l9yPrsX+8byyBmjG9gxEzQ2EAllipiOI5pp8Co/0EkB+bMYuyRjs5PSc79FcYkFajx
         hBdcV5VLzHKgspRK1AusP1c8+agbcRn7ITsbkhIQg4PQZhVCl8RtDTj8JdR2StVvjWS9
         3j/Ud9V1ESTo7O16SrZaqkANNa6QP4KUKLQxc+r9G5d8T3K4bFtY4P33CzyGL8i0+bcG
         TG0jRDm2Ah7a6wM1UcFqrYkc0sRen2ZlICpQiSnuIhttwwXNE6U86ydo9efcE699+GsR
         uxpwW7E9cVGPxWhkzHgKT/QjLTlWxV7VU/ewCETOHDqlIkDHFpyuX82vaOWO0JIJcQOO
         HzmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765277808; x=1765882608;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bwdcr6J6JkQ5MN9u9veUQ8APZTuYdOs+09yDTwCve4c=;
        b=Ndsbt++EbF94095fwfzLSyqCPOFa3ROX6hyxqmfEnOMJThaL42aNIOjPtJXwPJ47Zx
         lDNlo+LR7MBzmriUiM1kvlRxvsBJYj54BT1wVBmRFyPKxM69ArKfS161M4WocodXPt0y
         2jSp2Srmh45Ym1cHhEV+DBfXMR2VcH8pk91kpFbZjWLBt+DnfngnyQ10IIdSce4e+kbk
         8IpSLMEtiPdX0bXVPswKoGdKPGYv0KnROW1twwUvoxQEdKqehRXepFtdJiUihbnvh26B
         ics0SeEs5536wLIfRe8QxKoF/tlFPMqOkK9a1ZghGpapPvbecUMSC5wc4JTairmVfbYs
         iGSg==
X-Forwarded-Encrypted: i=1; AJvYcCXk134jQ5FkV4btvvSSb8c7/imdA8UbgnV8U89LZrRU6DVyzlD5R9vnY14nepOL0VVOjfHTtuzdkbOKm+U+Ag==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywadpsc35ojlMXEIlyqWJ+qEXsz+ZBuThNOkIiPSi6RAZWIsmT+
	ceEtIr9R89pbUYHGDffQM/j7nr+2LvZYfFPpoBTm2+5PaXeK4mXzpoSwuVvyBCtOR5lipP7+x2P
	G3Am7OAjC5gbOGQHpAH7UjwGisLUtZSQ=
X-Gm-Gg: ASbGncvGytmYvoaQLnetEsB/2jgca+oeN6CK3LRUS01czawnVB7hb+T7QfAfS28/mjP
	4NvhFXrLJzvC9RMH1znNlQybKPleoeOvKt0Xin8D1dqGoiURBNoJRRnOVThACGICvx1cOEsY3xp
	CDqjmVJjed3LRgRYJAosSfZXrt860e7yVC81eaAn50LM2rinfBRVOQf2HwcyDGC9+EpmPEhpaiU
	Gvp5IKB5zmaIgCGHGS70gzDqDUV2/03eDfHpkaR97qeBeX+WR/un4qnrB6C44Gbx+IRknAGNKfC
	QE8UkNs1S/ariiYmkAj1Tt7uP7jo8oxn2eAkJz/V7XbzPHgwZgup38NhimJh/biTqNATQGrBLok
	pFXVo+IdgFVjFkw==
X-Google-Smtp-Source: AGHT+IFvhi0cPvzSCKaZ1uKZHwQq5MrmhfsTuE4vvBZn212BPKoqThiqfNhiGSZoJvwzmV5G5qGINyy3cGPYIpxbNJ4=
X-Received: by 2002:a05:7300:d706:b0:2ab:ca55:89c9 with SMTP id
 5a478bee46e88-2abca559a26mr3005396eec.4.1765277808339; Tue, 09 Dec 2025
 02:56:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 9 Dec 2025 11:56:35 +0100
X-Gm-Features: AQt7F2onLl2G2SdnTe3M9zZMQUo29ueZ3enRDYXrYXm6UqTPRsCYNL8c_CkSU9k
Message-ID: <CANiq72mrVzqXnAV=Hy2XBOonLHA6YQgH-ckZoc_h0VBvTGK8rA@mail.gmail.com>
Subject: Mainline loongarch64 defconfig+Rust build error
To: Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Alice Ryhl <aliceryhl@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	=?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <christian@brauner.io>, 
	Carlos Llamas <cmllamas@google.com>
Cc: =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Danilo Krummrich <dakr@kernel.org>, Benno Lossin <lossin@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, loongarch@lists.linux.dev, 
	rust-for-linux <rust-for-linux@vger.kernel.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi all,

I am seeing in mainline loongarch64 defconfig+Rust the following build
error [1].

Cheers,
Miguel

[1]

 error[E0425]: cannot find value `compat_ptr_ioctl` in crate `bindings`
     --> drivers/android/binder/rust_binder_main.rs:317:38
      |
317   |         compat_ioctl: Some(bindings::compat_ptr_ioctl),
      |                                      ^^^^^^^^^^^^^^^^ help: a
function with a similar name exists: `compat_sys_ioctl`
      |
     ::: /__w/quick/quick/linux/rust/bindings/bindings_generated.rs:78264:5
      |
78264 |     pub fn compat_sys_ioctl(fd: ffi::c_uint, cmd: ffi::c_uint,
arg: compat_ulong_t) -> ffi::c_long;
      |     ----------------------------------------------------------------------------------------------
similarly named function `compat_sys_ioctl` defined here
