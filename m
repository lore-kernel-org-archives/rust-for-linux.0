Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37DB72FD673
	for <rust-for-linux@vger.kernel.org>; Wed,  5 Nov 2025 10:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762337995; cv=none; b=m7avxo/0WkVrZ6uOEz8zOoFdezeySeceKyZ92TCIsdNnSwaLwheYL4oL0U+z0RHIRZ/kOeR9bvw8+cvN0ieI/8GGUW9bhnxOlKEW9msCnjLV+BKHOgrurhPd3CBv4oYnx57u5nuRM0KTLn7ZFWULLx97hL8C/HpBuFP3sATsIE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762337995; c=relaxed/simple;
	bh=zcwOyR3i+iQCu6dzVq9q4dOF16E9XrrQF46JdXsYiRE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=rfaSzByb0RUki6BEJ8Au4IYhJsqT57MVBIh5+9sDVboUUE+CphKTKbJLlH6BuEkSG2g9N/UYD0alKKbPIaxkv5pcgMxMDAtVCSc3Gi88Royf68Cs4C5mY/5ZuuTUOF2fW76fgrIg9pizO/meY0XXn0kbHsTxUVyjQTNHDaOMZl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GiEu45u9; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GiEu45u9"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-47106720618so67021235e9.1
        for <rust-for-linux@vger.kernel.org>; Wed, 05 Nov 2025 02:19:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762337993; x=1762942793; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=gSDrC2UXjvRn1x7EpScqa90OTfMWc8Syuy/AT16lrpE=;
        b=GiEu45u9/dR8rnCnNVN0V16KzdhcXIB9pxPJZc4TuQneD/IkWEbO4LAoiQ4VTQGBpC
         WqDQegWcOyOg+tUNnJjSq8meEXM5G68BMiAsOmPaZPF22/Yqj0uE2cqttOVJ5GXD/1Sz
         LV1tJLq+teYevkGP7T1rzHqpnCBioOtPRxwtFzR5WLBfJuZ/vKetBWQ2lLHsJwFonOe4
         tVoXY17xglTRweea04X0zlWBNH2eWhmwCNp3Ago/K02kRIYEAcMNTL2Aiki4HfWt1Olk
         8IS2/sNULp4748hCc8ts2QQrjIDz2YszSk/4InvmxF1UcmbwQu/VeWYWqOjlPrsNg1Va
         NWCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762337993; x=1762942793;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gSDrC2UXjvRn1x7EpScqa90OTfMWc8Syuy/AT16lrpE=;
        b=uSBY5u8mT2Ypw9+d0zzqgw2NCZo7PMHJrKbpHJ15iDfvXblWPByVsn4xtIVRxsYSLi
         QPFIFp2lQGs7JS5wIWSZWtzxWoLSWDXMOVcWJJT30Wwd5WD0vFyCsiJ4mEo5lfHfWB8+
         gK7TtbHyTmY4wLp15uLfuJPzt/zf/L9dawY3NOokngkqt6/pRi64JGTSecp+Vw+i+f/6
         zBObSZ+2CoFYkC7jyqb4lmlXYIR39xyu2A8pQZH2LINMtWUrLlfu1VSi0IyOoxEDq3NF
         ZCAHbF1OgPLHEVPu5Hv6JVr5jfoqRKHIISBtgccHMolasloGr8XVwCbJOChgZWrqrbsQ
         qVwA==
X-Forwarded-Encrypted: i=1; AJvYcCUo6ww2CQfvbWMxGtQXzIfSPR70DbnIy1L6Bb1DtG3VLdWzfWnpLNc8GOHuxbgxiAWouClitI2qhhcuaEpbcA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyuPK4K88kiQjvfEHhIrZYQ2vAK8+myfg3KdgKKhwtmAI8gKPY8
	W/4mHOQScKfAoljU6KvlT+t/r06xXyiLWj9kxp920J3K+yOiMITk/GE3tCyIQQOQvvgJpbqNJ9X
	mYCNOMmmQe8sskQ31mg==
X-Google-Smtp-Source: AGHT+IFy6HLdLExBzNA/9DKpfS4LGeWapRstwfkqLi6/dGNf+Wnlmn+SJmKmH4X1ieaDRU09v81ykT8v7CEixB0=
X-Received: from wmqe20.prod.google.com ([2002:a05:600c:4e54:b0:475:ddb0:71ba])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1c8d:b0:46f:b327:ecfb with SMTP id 5b1f17b1804b1-4775cdc5348mr25817385e9.9.1762337992754;
 Wed, 05 Nov 2025 02:19:52 -0800 (PST)
Date: Wed, 5 Nov 2025 10:19:51 +0000
In-Reply-To: <20251105002346.53119-2-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251105002346.53119-1-dakr@kernel.org> <20251105002346.53119-2-dakr@kernel.org>
Message-ID: <aQskx-CkI1HNycQS@google.com>
Subject: Re: [PATCH 2/3] rust fs: kiocb: take advantage from file::Offset
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, ojeda@kernel.org, 
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, viro@zeniv.linux.org.uk, brauner@kernel.org, jack@suse.cz, 
	arnd@arndb.de, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Wed, Nov 05, 2025 at 01:22:49AM +0100, Danilo Krummrich wrote:
> Make use of file::Offset, now that we have a dedicated type for it.
> 
> Suggested-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
