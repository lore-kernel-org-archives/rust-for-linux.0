Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 090F41C84AA
	for <rust-for-linux@vger.kernel.org>; Mon, 31 Mar 2025 10:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743418536; cv=none; b=G1zqeOn5Y5OSr4SkwMZZkq6Zr+TzdWB+AjPN89mtqomw7wiULlbCjFjaJ8781nxpSrYnC64KiP6Vv8P6X/6k74NuKmLCejYn7ybZBbg4HGsNNZDuiCIRIiEgHgFzE+nbebBb+ZuML/djHw/btbgxDrTXB1K0aEs2xVmYC+y4Z6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743418536; c=relaxed/simple;
	bh=vcnTCsXFemPdu8nICunAeK4DITuUhCHZLt7aM+yyzuE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=shlVnh1xR+05JykdGhxLrFg/2NSloqOIPHmDQof4BlvoDzmEiOkUHDi1Vh9j5GRPFYAnz8ICv5QYsL4OeEeunaiQAKkIrmQYOtcL2DrMyQCnAaZKtqsO1HNnQlgOHAPO7WFU7rzpwIuAM+9Bv11j1Rwd8E4f1WXG/tg3G8SjFU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=McZRrmbp; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="McZRrmbp"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2ff53b26af2so964250a91.0
        for <rust-for-linux@vger.kernel.org>; Mon, 31 Mar 2025 03:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743418534; x=1744023334; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vcnTCsXFemPdu8nICunAeK4DITuUhCHZLt7aM+yyzuE=;
        b=McZRrmbpHFGuRZhj4kpAv9MIVrNpOLMvD8dV5dRWZw9Xe5+iM2NZP2JtRgTYQzoqQf
         /nraNeJaG9yi1agetVgj8uhfqy+98nSUxmReUVKCuBJRzPWUkVLtOg5ezDh0gkybRn5/
         M0zNl839jXPSCMrJPEISjPPKLTohCe0FKmFk0k5D9hlVtI5gRzzGIaEoOsqgKvCVaHfR
         WzDnJctBr4WjQkr67ka9+D2S1tWZxZlGfGF4zYG/kUQN2EAo9FFMXYUyaBrdADIiowGm
         NItdTSs/k9+Yt8eWnYWX+pTT6jwOl5j4YA1/bbBnRrLYNSSB8pfowQy2e1UbnzR9+2LH
         Rswg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743418534; x=1744023334;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vcnTCsXFemPdu8nICunAeK4DITuUhCHZLt7aM+yyzuE=;
        b=XmAGIPB0oDj1/ZjkuQbEAOiQysseeTVAKB6vRVLU6zLOWaiaUhe7BKMS12tUl6zEIE
         rGE5i2F6jUwIEh2PuzqqJO0LVRNQrH7Rns0clRFhOzFWQEnS+jkklNRombUp3VjNtNwW
         jeHCptPXJTQn6wgjzaqqWwcrIrmzTHn2qo3hP0BEgVtzdYhW0SiD5jQ4iV2Rkw9JjCO9
         nERA8cPCsZpbvjbDXApHbQn+/i9LFI67Yhim+7OoyTO3S31HSlTUkKMuCaKz072BENIQ
         gu7N17zuOwgVVKxDrpCFDh5G+WW6DJERhANd48/NBVmpxJrOuAsjDmqPgJ8u4x2o1DYH
         jofg==
X-Forwarded-Encrypted: i=1; AJvYcCVi4TUz6fHkp7aRrLj/3kN5Jan+caSD6FL1n1PcdKuqa5RfMtMbCv09qdLEXtvsA3rsyFD2st2guxEdruof2A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzhtR3YwCJbQAz5f1PqZNVsia7/it/XjyaJ14DgxGdL1+8Zpk5L
	a7xiqgEepl/WmbTULDl26+783DzvuDD1mgRf44PxQXUMeusjZB+mqk2tYCb2BjEYQoKDAyLd10o
	qI2R1U2nxvQXz1+fOJ7TvfP+IuCg=
X-Gm-Gg: ASbGncuvS0AHUCEDi2G4HsVm/sGYpzrY2+12VnIYloI3M0MdKXauNNQC8yBpp7auXO7
	/TYziH+eIUzZwyXUdLR8vcPSv44MYbJDZSAxM5Ko9TGoI5qSVMCse3iwmiaoQtOdl01zRozoQmK
	Gy5SXQW7R69XNKMn2SqTRMMbXmCQ==
X-Google-Smtp-Source: AGHT+IFJhnBxJxm5CKLS3EBTjj8s4L5HzwsfQorwV0Qup3E2yq9lhau5T2dSLYAh6lupxHD3bBTRfxudW5v+DWbWMKk=
X-Received: by 2002:a17:90b:1c8e:b0:2ff:7b41:c3cf with SMTP id
 98e67ed59e1d1-3053215127cmr5161045a91.4.1743418534227; Mon, 31 Mar 2025
 03:55:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <D8S8C5W0FCVD.1LH1E86H6PXZD@proton.me> <20250331101325.2357367-2-igor.korotin@yahoo.com>
In-Reply-To: <20250331101325.2357367-2-igor.korotin@yahoo.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 31 Mar 2025 12:55:21 +0200
X-Gm-Features: AQ5f1Jqft-Zp_5yCDS3RQqDwcMGMpXXzai3uuj0Zlt79eexcFW2KmrOnxkVeVKA
Message-ID: <CANiq72mdvsjo3BPpXrFCo7Xqr=PVYiGqUh=n4nsKwChSU1_Uow@mail.gmail.com>
Subject: Re: [PATCH v3] rust: macros: Fix macro referencing core and kernel crates
To: Igor Korotin <igor.korotin@yahoo.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 31, 2025 at 12:46=E2=80=AFPM Igor Korotin <igor.korotin@yahoo.c=
om> wrote:
>
> Took into account all the remarks. Hope this letter with the patch covers
> all of them.

I think something went wrong here. You seem to be using `git
send-email`, but this doesn't look like it came out from `git
format-patch`.

By the way, it may be easier if you just send it as a new thread,
rather than replying to the previous version.

Thanks!

Cheers,
Miguel
