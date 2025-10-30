Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C47A28751A
	for <rust-for-linux@vger.kernel.org>; Thu, 30 Oct 2025 13:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761830724; cv=none; b=Vg7ynrfoaJMRhqciFXmxJdAgm+RlBZ1hhckQ1ldfFjvB4exvbtwRJEvTId5eHc3GfHZQJQhxCRKaEz5A8wwzsOMY7zrzWQkUF0bhId81FZW5I2TQe7OCGiH1E0VRsGe7Kjj5plvHfBAVa8rpsC7Da/cUOd7NsiggHdVNr6l/kY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761830724; c=relaxed/simple;
	bh=EBbL28z9+MZVw5L1Pv0y6IwIp7d0O1Hu7XPd9vzv+4E=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=UjTg+EQhbtQy79YsW/bj87ld2+BxBfHlbpCLuxWeSw3hDE12jRBR99jUuqi95QIGiKe7ejqwypnIt8HIVNoCEKk5w8U20ESY3oQ+DDheEuX4CPZUho9g9Oo8ku5g1Rgo99kQHdK2ZbBT/+iJxO22O1wZ0ZFIFw/AUwHIKH5V3Ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ywQXe4TB; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ywQXe4TB"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4771e696e76so13627035e9.0
        for <rust-for-linux@vger.kernel.org>; Thu, 30 Oct 2025 06:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761830721; x=1762435521; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=7SeX/dCS6cWxKpNw3QkcX1Xk7rCu/Lia0ZbW7lkHN4o=;
        b=ywQXe4TBFGJsINg0pYv0IA+lTwGCSmpCq22Ogppws0U6E2t6GJE70/hNG76pvrjpAV
         pFNeHA2TJcwi3g0Aq/sYYfAcj3evUZ2V3PLLrzwp7ZQ6jr4BGTl1fn6w0mfHy8rnH3PT
         MF+17zyi7qIztduF68bYzkKpo4HT5CN1mLyHVUPh8ysSa6hLnOD2fuePHb2c5Gwsyju1
         8JvOx5ifg1cDMl7J3RZFSlDC61nDYN22bQCPAjroyoNwOc6uB1/DoLFe+gxswIPiZFB9
         JINSa7DrhKmjaeLyYte4QqEQ25unB5IzBLf/uxx49v+LtOJKgb5XqtSKr4kvlFHdVVoq
         Cl1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761830721; x=1762435521;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7SeX/dCS6cWxKpNw3QkcX1Xk7rCu/Lia0ZbW7lkHN4o=;
        b=dsPQc1Gq5eajKU3NK6JSc0ayc4C1NLVsZ30VQO8x1psUTbZkf/WbV7H94k7moKv4ia
         b18J0LlpSiUTg5a/0IFzPSYLvLl3ohD6oGjlwjQU0CmpSq8U02zHIyz6qYH6cqYHUmXy
         PdoqGOpBvF2on9fWDuPnG3Trorvuux9VpvyRefuJ6VAwFoA3gcrLdvVRPC4L3aav/h4D
         cbxYgGa1I62oaxaGcNlzRt2jOQCGcWy4LEo+aWsfRP1Ih8iNBgDiL7VfXic0ykIBdhOm
         m4GA7luZTahWTDRSeaFjbdd0MtnDMdYgUwwUHyOgMMIFLWwPQMV4zE/IdhtrOzgcHGLk
         /S5g==
X-Forwarded-Encrypted: i=1; AJvYcCWSrH4bD7+IEcb2YgGlyzb0TuvFcyir/iVDVWArRy/xeUlM9vrBmOhQj6vwz/qVAidgRTai5Ld6TF/iCeyvjw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0DvMd0iwmyqir/EVuy0THi5Bot8kqNnTLpOadlogjUsqCjfLH
	jYFp2V/sTJWqfDxB25TpP6SP6oV7DVuOVZD4/I1hjGEFRqW0w5R9bUvV3CxJOk6Z5Swkt4cuVXX
	BwKwv3yGj+B4MLD31Rw==
X-Google-Smtp-Source: AGHT+IFTtaqS9U/7UQQTwaCrLeQO1lf0jngWAua0qbmHooBBncQ6je3VzSX+qVsJRKDBkzwT5OFndSyoGqXhRE8=
X-Received: from wmbz11.prod.google.com ([2002:a05:600c:c08b:b0:475:d8de:fe5b])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:154f:b0:475:de68:3c2e with SMTP id 5b1f17b1804b1-4772687374bmr25909005e9.40.1761830720992;
 Thu, 30 Oct 2025 06:25:20 -0700 (PDT)
Date: Thu, 30 Oct 2025 13:25:19 +0000
In-Reply-To: <2025103017-driller-implant-849e@gregkh>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251030-binder-compatptrioctl-v1-1-64875010279e@google.com> <2025103017-driller-implant-849e@gregkh>
Message-ID: <aQNnP6FWv8dA2_1o@google.com>
Subject: Re: [PATCH] rust_binder: use compat_ptr_ioctl
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Carlos Llamas <cmllamas@google.com>, 
	"Arve =?utf-8?B?SGrDuG5uZXbDpWc=?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Christian Brauner <brauner@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Thu, Oct 30, 2025 at 01:38:56PM +0100, Greg Kroah-Hartman wrote:
> On Thu, Oct 30, 2025 at 10:41:04AM +0000, Alice Ryhl wrote:
> > This is commit 1832f2d8ff69 ("compat_ioctl: move more drivers to
> > compat_ptr_ioctl") but for Rust Binder.
> 
> You might want to spell out why this is happening, not just refer to
> another commit to try to find that information to make it more clear
> here as to how to attempt to review this :)

I can replace the commit message with:

Binder always treats the ioctl argument as a pointer. In this scenario,
the idiomatic way to implement compat_ioctl is to use compat_ptr_ioctl.
Thus update Rust Binder to do that.

Alice
