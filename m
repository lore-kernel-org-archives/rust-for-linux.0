Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E177B34679E
	for <rust-for-linux@vger.kernel.org>; Fri, 24 Oct 2025 18:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761328953; cv=none; b=LWHDrDZhjaL+51cENakYZS/LyfueqpuI/3WEHGW7lbt80HVOhr2TJG6RxUQxwLHtkcjC9XoVdhPr2lBaVxvB5Bu6EofR/A5FpV7zRUB/E/hSH/u2rzEZqDL2XaQ+cdH0ssxkX1gu1+prx9tUCwZzS7q2p7eFiVHs0o1H11FYqQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761328953; c=relaxed/simple;
	bh=NqIgJcJa2diXyLKkZeV5zTmt7c/3DcWq0YdvpFsQs1U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r9MhP2ifDx878j6g3uBqzBEZhALCt9sgaMjQrZEXPpdg9CN4K9uOzSGI20UfhV0qkcjBsl5O8C5caWso9HDjlyPmDf1nm/K/fY0Uri6Fj58CrC+4X5mKwa9vGIr/UTr6m7M4oyzWDqqbzHqEx7QVESrWtju30zRQqGcpunxFrD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U9MoNn9J; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U9MoNn9J"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-27eca7297a7so3073995ad.1
        for <rust-for-linux@vger.kernel.org>; Fri, 24 Oct 2025 11:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761328951; x=1761933751; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NqIgJcJa2diXyLKkZeV5zTmt7c/3DcWq0YdvpFsQs1U=;
        b=U9MoNn9JMoV+ejoI9l7i2tBdHgVTB1X42wQkQ/RvY36W7RueHRauazQL9niaJmZHsZ
         octavXG2A7Sk/UdosBZV6lKwpJ+Qk+P5uYLwoCbEDMzYhe/uWAjl1nYEduWAm6MHAPZw
         RojdrkuoSsx07slerizWuEzac879W+sQnn9x113e6B5KlhifUgywkc0wGb4UsMFAhVh+
         von4uMpMz+0/JVur296QBGDC9SwOETAbDCT7JplmeZ6sK4N7GOCKuNBDAW56wFobynJV
         6I7rffhwtrQMSL5tVNQyRGAJVrCsI9G6LDg3fVdX3CtSQ3HtOtlDOy55CnRmPBPGzCjH
         Y83A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761328951; x=1761933751;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NqIgJcJa2diXyLKkZeV5zTmt7c/3DcWq0YdvpFsQs1U=;
        b=Q9VpZP/JhnmEt8sNG0QSqPyVPeEj1m8oS5Go9DojLKUJULz1bu6cahO4wgCLoxdTcw
         f9gXMPo9ceV82kFqGM8uwcURJ6MqZh17JJYSRxrXbaTvaOZ90W8Qd8f6gfMiJqP70mG5
         6lCpBvpI1X3y3lIAldWv1Mn9k/HMV1o4zuAqiO3sUfyveBt2PUM5u8+L2ETP+RA+1Lmp
         aNwEdOPCgBMGeiANflng7CWdDXoezw/mbfRMwnxlw8CoIs0m71yhhTloUnjejDrfez8W
         150l9E9yWSKt2zIlYET4TsaHmp/Hv8ewBjs42MqzfbOEDe+SzkL4Chajkpcedz3xMc5K
         njAw==
X-Forwarded-Encrypted: i=1; AJvYcCWGeOLtotxmgR9W0pV2OGSnb5D2cpU7m0ZrSCgkO3/1AdMRg4QdqUfxgyOOUHRCUkukyD1gmTKvz0aHG2kvAg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwyAmfrXDMP7lzoNhvwbkFT6nUi29Gb1I2lZKzAXDh6MY4Fp8rE
	QHF8SW4odOiUwF0jCVg/JfWCec1cPEPahYoM76GzQE+saHVrA0dLMSMR9ufx//mTaPM+76ai4kb
	mRbDxlOPMfgqMDl7/3gKugvWCowPlYw+sGMfT
X-Gm-Gg: ASbGncvRWAawBbO41gPU3ZXIrRjxzIBU9N2WO7bnb/gHmIVj36g/oRePhUHq8Y79T1S
	a5TSdgl6EpqHt153PgrxtjeGa3KgCdMXwZUJ7sRmAOG6WYZag2pk1jQmuDVGzrCzFIBhkNerTa0
	vzVTWS38T7et+ZLk8XJ0ReH89kD2o2fPA64/uKl7mUaUz7zpLcb8C+cZAGJyPNQNnHuTXxkfKYn
	aMHFLIyjF7pt4FLSX/d0961LlwniXRpJ/UT8K7Z37/YPcf5xdb17PWjM5QjB6IVuUkJ9SpAn6YC
	vq0T9njyjPUigODYFt7ZVuqH3Kfq5w3qTL3eCbmWOPCosDTafCMEgWSh8I2EEFs9yeR5K5PAq6x
	/inrDn3T2pXxCiA==
X-Google-Smtp-Source: AGHT+IFXN036gyk3u8TwThknCoOvSHyTdnq5f+a1361AXFhp2hDWxvNZ+IEnVkZLJJwnHPwu6ofnzTCYlg9/mxn7rEg=
X-Received: by 2002:a17:903:f87:b0:27e:da7d:32d2 with SMTP id
 d9443c01a7336-292d3fbbf0cmr97350035ad.7.1761328951021; Fri, 24 Oct 2025
 11:02:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251022143158.64475-1-dakr@kernel.org> <20251022143158.64475-6-dakr@kernel.org>
 <aPnnkU3IWwgERuT3@google.com> <DDPMUZAEIEBR.ORPLOPEERGNB@kernel.org>
 <CAH5fLgiM4gFFAyOd3nvemHPg-pdYKK6ttx35pnYOAEz8ZmrubQ@mail.gmail.com>
 <DDPNGUVNJR6K.SX999PDIF1N2@kernel.org> <aPoPbFXGXk_ohOpW@google.com>
In-Reply-To: <aPoPbFXGXk_ohOpW@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 24 Oct 2025 20:02:18 +0200
X-Gm-Features: AWmQ_bknF0O4glT__QBpD7EtGbQw3f2JbbITF9mBVx4ARFlGbB71froz6CcT2AE
Message-ID: <CANiq72k8bVMQLVCkwSS24Q6--b155e53tJ7aayTnz5vp0FpzUQ@mail.gmail.com>
Subject: Re: [PATCH v3 05/10] rust: uaccess: add UserSliceWriter::write_slice_file()
To: Alice Ryhl <aliceryhl@google.com>
Cc: Danilo Krummrich <dakr@kernel.org>, gregkh@linuxfoundation.org, rafael@kernel.org, 
	ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, tmgross@umich.edu, mmaurer@google.com, 
	rust-for-linux@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 23, 2025 at 1:20=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> I would love to have infallible conversions from usize to u64 (and u32
> to usize), but we can't really modify the stdlib to add them.

I don't have a link at hand now, but we already (recently too, I
think) discussed having these "we know it is infallible in the kernel"
conversions. Maybe there was a patch posted even.

Otherwise, I will create a good first issue.

Cheers,
Miguel
