Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B17E01991B8
	for <rust-for-linux@vger.kernel.org>; Wed, 21 May 2025 14:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747836778; cv=none; b=lQVxmkdfcXRx5mpWSqnk+hzgdWaUj/s5qKWWKPtr3S3ahpWRVAfLT6Q78C6keEdApMRR55sbimtQIaoZ7yr6Ngr7n63DJ91VcbR3ejXwJhWeX2NM4VUYPc3kTjBbC6VSATH+cpo78JiwmrpT0aVOJKQEAn2u257c0jAgqca7uRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747836778; c=relaxed/simple;
	bh=tv89TdYRDcaEXjK0RC682Sl0mRbM4W4U4AGQU5TPCUY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J9i3/MJDKaTVgRsbtwmV2ENTxi5Rms/HD72hHWscxSdUxCPSjwSmqCLCebUsvnyifEufPKa3ZmouPpZlatzO30VgWoX939CvavY1JqaboBbdyqQTP8Z5YPgmiB4Hnj5BFDfD//fr5l8dpFm+jX4ui+dRH2OwbAJG8/Dxk0MQMhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HX1K+Xcr; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HX1K+Xcr"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-23179999d4aso6649455ad.1
        for <rust-for-linux@vger.kernel.org>; Wed, 21 May 2025 07:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747836776; x=1748441576; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cZeJoKQdMpkKNmfE57ZtLzmHh8pwv3kmhKXYU4AipcY=;
        b=HX1K+XcrZQQefFVpJCkamVZR5SJakaNHzPz/cVRRZpkKZKm5EEmYyklUZneeSHAcGT
         MuXnT+rU6dsTv6Uwj9/uTSXPzZ80p3l5PGqMnazq3uCFTJ9xciS34bzLn/d8mtJmkPWU
         ESeTM5d1ZJEBHnGiUhR5Cr2NwMVJShS3hG4kJMm538NVbqOR/OYEF/VcvFQ6YeS9921Q
         CkmXBDMrL67U2R7c4o11AAAHuuL/ZC9QExEbLseMjR+FCNREHW2O+zz5WCQ3BpY1EsE0
         papQcspFQnAAmedELGjkcq/uXdtLyNC0twWECe2gAyhpqh/krRO1GZoi4NHfLm0RUgco
         Dy0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747836776; x=1748441576;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cZeJoKQdMpkKNmfE57ZtLzmHh8pwv3kmhKXYU4AipcY=;
        b=jdZ7qHTOxuCASkeIqnVpoESv4ykPD3/Szv6OmpttQ+wMQEKN/6upYbOHROg1bxAWa1
         OYYaSKn9TADJZImLV76YJ/s5Ct6UpdVwl5Zy/Kj474k/JWXPoyYo+gYOoVOiv40HJiJJ
         6zIpl8f6KzEqbomfYeJxuQ7aro3aFzcozJurxuNwzRruyt1SumLMMOrOzNNfwo0w6DHt
         bSN/m/m0uJVvlNLcSJ2yEDtIX9XJ0bEM4KTNC0Pun7P69krzF6JYhlnh/w/MsDpEh8Yg
         Rbys6cs7DpsjKLvlgrRi8GRHaQCcdZFSeNimuweLOy6tQ40fWIZBqHtHEjQUWm6+K59R
         XJig==
X-Forwarded-Encrypted: i=1; AJvYcCU2cbvMc4SiGueirhIv3kKHGyVjlxom4HJ3gcvKVCDOBQDTHu9Jq5YTCs51o12++ZPZD5k3fDC/8zQ2+TMegQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzFYAzO91zBhyNEXEVPQpIT8z3mUQQVrQX5U82FLRQVLhqQpKH3
	we6uwUHkNQvCCtWjAgpqJDdlkvQfEsD3H+sy2+WHt25C2p/rmDeDnFCVwBqQVoK7TdTW0OT9Gph
	yRVp4jRMBp3fbNrVhY78xkoXVIoECh9Q=
X-Gm-Gg: ASbGncthhnAmSnCmdQ1E/ULLThUZoYmFCHxj/9DERMmeoPxcINzvau7ujEIFH8xQs6p
	uouDyomfcwGSAVTX+GhtJGlG7NA69/a8cv4PJCTM/2UQi1MMa4FXcjnBPePbT02Q0tE93l90Pyf
	7wHbKIP9F7XJ37VF3aiD/8VqfUyVDYORXqw/OHXFsWDl4=
X-Google-Smtp-Source: AGHT+IGBdXbxDKmeejsZ/TnvhmMsV25uTCv6QeQyxRIEQO6oX3WylHd/JKbXOWnK0DUF5wcXU707WpXtxm/dbRai5io=
X-Received: by 2002:a17:902:d4cd:b0:231:c9bb:6105 with SMTP id
 d9443c01a7336-231d334d214mr111550115ad.0.1747836775973; Wed, 21 May 2025
 07:12:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250516122349.1944895-1-igor.korotin@yahoo.com> <20250519164615.3310844-1-igor.korotin.linux@gmail.com>
In-Reply-To: <20250519164615.3310844-1-igor.korotin.linux@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 21 May 2025 16:12:43 +0200
X-Gm-Features: AX0GCFtU6oHTXb6Q41Z-zHdTjcycNRbHeIwA_LHZybffZUvC-9SbSeV9EBBGVp8
Message-ID: <CANiq72=Ae7yiNiVO9jr38kMW_aMOOY+q8OCCyh88ceF4z7GphA@mail.gmail.com>
Subject: Re: [PATCH v5] rust: macros: Fix macro referencing core and kernel crates
To: David Gow <davidgow@google.com>, Brendan Higgins <brendan.higgins@linux.dev>, 
	Greg KH <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	igor.korotin.linux@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 19, 2025 at 6:49=E2=80=AFPM <igor.korotin.linux@gmail.com> wrot=
e:
>
>  rust/kernel/device.rs           |  2 +-
>  rust/kernel/device_id.rs        |  4 ++--
>  rust/kernel/kunit.rs            |  8 ++++----
>  rust/macros/kunit.rs            | 22 +++++++++++-----------

David, Brendan, Greg, Rafael, Danilo: I will pick this one up -- if
you prefer I don't, please let me know.

Thanks!

Cheers,
Miguel
