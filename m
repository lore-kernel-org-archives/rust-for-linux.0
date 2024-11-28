Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78FAE1AA1FE
	for <rust-for-linux@vger.kernel.org>; Thu, 28 Nov 2024 14:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732803212; cv=none; b=RCGv2W7y/rDmogfN4M/Qhf6Ezi5/INRPAAStBHH+P0zP2lhadxAU6Humv5HiNx3nplSilueqCHKW5wpS/Ifh9EqCUKJzcJkc3eSRnQj2QqHRkfxLOtaeFtj1n+cmhGVmGwgKHJ21e66uAlfUcL08bom/Y6zzMhhEmzBXwUXMMUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732803212; c=relaxed/simple;
	bh=yD5Q5wZvheIwUXY/KFJ7wxZT9LtULBr2qSQmR67OXCA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:content-type; b=R58EOh5PbD5DPzzUptOld6rDar40quAOZgdyC13gL97qJmvsegz0yfOCozu6ACIv10Ej2AvSRYPBMGoTVQjACni0IOK9LhUSMUwpef0UhBbnvoMtuYqFi6oZRJdjz1NKvPHl5hn6aInhhq4v8Qz2Ia20txcsuo7fnTAGERStVL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SHb6eQGa; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SHb6eQGa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732803209;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=eFsBZoz/kN/9IvyG8zSeZd+VHQ5VYtjhxgkca3XVrWM=;
	b=SHb6eQGasYPID++nZi5SdMo0Sw7tssSt65BaYdffrBu+dRBXkopeYT53FTDBya2SPr+vb5
	V620SEaQem27NqYg5kauXfAJjSHveap8ZbYyROmQgbPy5OKXiz+6D5oZP0nr3fDU5kETJ4
	sJUXeUiwhhAO6FTSgLIgEH98r+mLPF4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-449-pFLsS6XVOqSRCkuBVZoRzQ-1; Thu, 28 Nov 2024 09:13:28 -0500
X-MC-Unique: pFLsS6XVOqSRCkuBVZoRzQ-1
X-Mimecast-MFC-AGG-ID: pFLsS6XVOqSRCkuBVZoRzQ
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-434a51e44d0so6992125e9.3
        for <rust-for-linux@vger.kernel.org>; Thu, 28 Nov 2024 06:13:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732803206; x=1733408006;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eFsBZoz/kN/9IvyG8zSeZd+VHQ5VYtjhxgkca3XVrWM=;
        b=g2E8h21sL8VTEewc09TrzgjpN3IukQWKoTe8NWKIRjqal92HlxgthI8CQUkvvkXthv
         gRBkiT/uA01P+iqjJruE0sdo9Z+EI4Rnn5VTLX0h/Naia0eJRqjWrGIZ42h5YpkTzyII
         QUM/AK+Fv85NHg+5o19XnLqdaYHSaZvpblibmc5yywkdQjrZkl4Lr0djqvuzOYWipuJ2
         TzRaJIuoupunCAYNG7k79SErmouD3M8JrJ7oHSlOT7Z35OOPGfTE7vQhRmWUaG4AebdJ
         4RIzDjpOqItB9yD5AyMS0rAotLwSiXaIggpw/qoOu0rWju+AEgdDawNb4YU8zAk059Td
         TuOQ==
X-Gm-Message-State: AOJu0YxN2AGdzFkRQB6EM6DhjdlnZrfqdMWhNTNBEuyLItM02YjI4+Dx
	Z/LraqjjKpuk064xBFVNHdM5rr3wfjKvp6BoG+hn1lgCHzG6X02maPEYWNcfQpjomN86iTrFBJ4
	UdhoqfBlcXzWd2Tdb6EMFuRTBnv7CGiTOeqImKzi+z8tpNINR0iHfnj+pNfQtXgd5bPKo7eiYd2
	aioDFIRME48oNa4DhlFz+WR0XyzCd//W0ZkfzsjiT+JAIxCHl3
X-Gm-Gg: ASbGncuMtzIxRASNmcWfDWEoxkCRfPZn1rzFfmLksZ30EXxSCjG6xvRUCwgrDcWKy7i
	+7xriOrGwmyx1lEq7kryUbghsnATNF8iCS3ZiT5WnRZ+9kMVNOlHP1tMN2px0w+6+iM1hjjmPtL
	QCdZBR0lPoxv17ENUORM3Tz8gE+en6CSxknx6HtZPYjTbzpxH12Kd63pk3UR6EZrgGjMS5+Bdbu
	Bdbhkm2PXEqUnavZP2TYYWhn0nzMNFeff6FdYS2tlGggkZdk36+gA==
X-Received: by 2002:a05:600c:4f8f:b0:434:9fb5:fe04 with SMTP id 5b1f17b1804b1-434a9df0803mr54354475e9.28.1732803206144;
        Thu, 28 Nov 2024 06:13:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHqoUgC0B/BsNzaSIUqS8QJOqlXUm+jN1vmS7PC6QL4Ag9ticcO21txukzG7GnLpKYtYr5A6g==
X-Received: by 2002:a05:600c:4f8f:b0:434:9fb5:fe04 with SMTP id 5b1f17b1804b1-434a9df0803mr54354165e9.28.1732803205704;
        Thu, 28 Nov 2024 06:13:25 -0800 (PST)
Received: from [192.168.10.3] ([151.49.236.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434b0d9bc11sm23790635e9.4.2024.11.28.06.13.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2024 06:13:25 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: boqun.feng@gmail.com,
	ojeda@kernel.org,
	benno.lossin@proton.me,
	axboe@kernel.dk,
	tmgross@umich.edu,
	aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	gary@garyguo.net,
	alex.gaynor@gmail.com,
	a.hindborg@kernel.org
Subject: [RFC PATCH 0/2] rust: Zeroable: allow struct update syntax outside init macros
Date: Thu, 28 Nov 2024 15:13:21 +0100
Message-ID: <20241128141323.481033-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: uGGinycGamPbFX-wf9gyZ7mK-tE-1o3Ys2hu3CRXfPM_1732803207
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

The Zeroable trait is a marker trait, even though the various init macros
use a "fake" struct update syntax.  Sometimes, such a struct update
syntax can be useful even outside the init macros; therefore, this series
adds an associated const that returns an all-zero instance of a Zeroable type.

I'm sending this as RFC mostly because the diffstat is not too favorable.
This is mostly because patch 2 has to keep safety comments above the
"unsafe trait Zeroable" declarations.  It would be better if the trait
could be derived automatically, for example via "div rustbindgen" comments
(not my favorite syntax, and grossly underdocumented; but still).  That
would also remove "unsafe" altogether.

Nevertheless, it seems to me that this is a small improvement in
readability of the code that *uses* the structs, and it may be worth
considering it.

Another request for comments is whether the "..Zeroable::zeroed()" fake
struct update syntax used by the init macros should be changed to use
"..Zeroable::ZERO".  The trait does not reuse the init macro syntax,
because traits do not support const functions and it can be useful
to use Zeroable::ZERO in const context.

Personally I think it's not a problem, and decided to keep the two
spellings separate: "zeroed()" when working with the Init and PinInit
traits, and "ZERO" when working with the actual struct.  As far as I can
see, "..Zeroable::zeroed()" is unused in rust-dev, which makes it trivial
to switch.

Paolo


Paolo Bonzini (2):
  rust: Zeroable: allow struct update syntax outside init macros
  rust: block/mq: replace mem::zeroed() with Zeroable trait

 rust/kernel/block/mq/gen_disk.rs |  8 +++++---
 rust/kernel/block/mq/tag_set.rs  | 10 ++++++----
 rust/kernel/init.rs              |  7 ++++++-
 3 files changed, 18 insertions(+), 9 deletions(-)

-- 
2.47.0

