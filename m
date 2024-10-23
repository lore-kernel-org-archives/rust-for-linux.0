Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 763961E2614
	for <rust-for-linux@vger.kernel.org>; Wed, 23 Oct 2024 21:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729717567; cv=none; b=E1IA9mK8jw5dDujHiCsGeMi5Dj2xKLgkSqA+xyNank4l+7a5AvF0tZza6DW8IQQdpDRkD/okJnKcypsRi+ufy558+hqgT67O8Obg4VFt7X/lLCyE6kJbALjk/cWY4F59pFbFCeZKmP0DhG1kO8WHfzOk2Edzh8O3ZItnYzg3/J8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729717567; c=relaxed/simple;
	bh=/JEcIBihja6V3LP52eHEY4Q3j5KZkMGS+N+dxgjhsRc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X6dA2TV20R+BBnu8zzCGi/8voGIBCjQjl6rHWP25ch8yD0AeL4a66kNpqRV7P5X0rA2u+WZ8lrEvDh4SLF3YFZAwpINDB5YkRLaRgWxEw60dIvHEU5B0KW+nkta23AJDpk7QOMMXW0zhs+G9/2kukN25wLiAn/oVhx9LsmHuyK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=X4YNJ68t; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="X4YNJ68t"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4315ee633dcso14545e9.1
        for <rust-for-linux@vger.kernel.org>; Wed, 23 Oct 2024 14:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729717563; x=1730322363; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/JEcIBihja6V3LP52eHEY4Q3j5KZkMGS+N+dxgjhsRc=;
        b=X4YNJ68t0nwRFvxpqTrPL5CBJYmjDBnPdlWa0T0sajxnUKiHqH6PxrgMr7ESOh34Go
         uRnj9cS2v27XeMen/pbCT4inSZRm02OoqPJbSPT89R4TGKiZ6xBhpx9Ej2/f2UtAGK7F
         7T8pCdmA8lMC8cFzK8G8Ts2sTNVbIebfcFU6KlDTuHW/oRL8tdEh3U28hbI3LZQkJKzx
         o6LVG9QUzf7ytipO8RGDhSttTdF/ri4QUukc3vge4W57Mxt0enKDk8lVPvvUNd50/UQe
         3bgWCpGfzLU0I4dMdOsZbkymfmn/qT1CbmRf/UuhCaphnrWqGkKv8hZ0Ovd3bKxPUdAI
         txLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729717563; x=1730322363;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/JEcIBihja6V3LP52eHEY4Q3j5KZkMGS+N+dxgjhsRc=;
        b=WdEHmXTCF29XvWQ36BAZvMb280tt7+hPr/unMiqrJ5s7K2k0YX4oElZB5pztEL1uJU
         Bi4LVLfelPr9h/Wxe5xn88qInL8T2gOQEgKRJKqhg57iN6WGjHw+XspEDUWssnLO3fc4
         ODNnX0X26VEyqIA2Mmzc/lFlkxdz0EYdTcI7zwEhfbUEnEJdDvBSunGhmxAMi2rzTHm3
         EgtP06REZtP4EZJSHen1DT4WhU4LaCIMm201PFpxN/461syc1eXHnRfvOt+RZIHvVBCp
         ZL7VyJBRvZMH8TxFNSM+LodIXjldJHrJpX0GI38o5rAcL1B/G4IRHcnhLqJfQYo+w4G5
         6lmQ==
X-Forwarded-Encrypted: i=1; AJvYcCUdwOkwht7dud3bgrRBNGEFIeldU0Kiwnqde4A86QDkJwmPAb/k7Rp/4BDJA1i+NAyGGtwvBpUTT4R/9ftvcQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyeH19JrffM5xoenOUTWC/3uMBRIx/tNdBq/TyUuvspRvQ761Z7
	SZQUpj//1ZjcdLaExF7tXl7duRz4es58EAuxjrPdFjDYrIyjWrkNrsmkaqJfChIv2Fg2/+MEwXK
	T2+j2zaFG7DrUkqTLWUVQALInJQi1nhA1h5g7
X-Google-Smtp-Source: AGHT+IE7E1sQKkdi+IOPziXhygUCQe4DRbGEMh2n+xHqKHoCU4m0rJ13HS4/hKLnTcO13YuD7nqu8DLLl+hDRTXCmBQ=
X-Received: by 2002:a05:600c:5023:b0:42c:b0b0:513a with SMTP id
 5b1f17b1804b1-4318a50525emr1319735e9.2.1729717562737; Wed, 23 Oct 2024
 14:06:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241008183823.36676-21-samitolvanen@google.com>
 <20241008183823.36676-36-samitolvanen@google.com> <55549683-2453-4b67-a380-8ace34b3a06d@suse.com>
In-Reply-To: <55549683-2453-4b67-a380-8ace34b3a06d@suse.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Wed, 23 Oct 2024 21:05:24 +0000
Message-ID: <CABCJKudc-f4OfyfWnDwXGM=ohSin7Z=y7Fk92Du_17LB9ptV+A@mail.gmail.com>
Subject: Re: [PATCH v4 15/19] gendwarfksyms: Add support for reserved and
 ignored fields
To: Petr Pavlu <petr.pavlu@suse.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Matthew Maurer <mmaurer@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	Daniel Gomez <da.gomez@samsung.com>, Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>, 
	Janne Grunau <j@jannau.net>, Miroslav Benes <mbenes@suse.cz>, Asahi Linux <asahi@lists.linux.dev>, 
	Sedat Dilek <sedat.dilek@gmail.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 23, 2024 at 2:53=E2=80=AFPM Petr Pavlu <petr.pavlu@suse.com> wr=
ote:
>
> I've noted some nits above which you might want to trivially address.

These all looked reasonable to me, I'll address them in the next version.

> Otherwise this looks ok to me, feel free to add:
>
> Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>

Thanks!

Sami
