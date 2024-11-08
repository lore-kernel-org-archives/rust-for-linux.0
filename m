Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B786D1E22FA
	for <rust-for-linux@vger.kernel.org>; Fri,  8 Nov 2024 11:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731065970; cv=none; b=P8KBEn6CsNRPtZca02MFpTYSqNmMmgjgIv3MBwfYIoYZnsvKa5lJKuoky/w9/wRdsErwYz3Ntfq+wws+nriiMTX1RAq8gtlf1nODy8K0P5FmgS9fWkBvMj/Sv67D2uevwbpkegIDUq9WIQuUiDMnHJQDbRFa7QiclkPvDW/xK8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731065970; c=relaxed/simple;
	bh=Mx8IX/Oejjgsq+PXa5DoK6tONKLcry4AmnXKYd55j60=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nK27s53MbxBbWWgQVBqpqg1fgzslLVCIwYHphxZIQO4q7eEwUcrHdSbNub35tDI0Mv6aaYiwBAdUQGwZsAYhywiztAEUjSss+oxlhlxvJ6+NTZs5jEBaw2LCXRzT4VFdYKzFJvILcQg7FDg7W3mR0k4AZcTuXF3FqmWgf0GK+6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WJY0MKQB; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WJY0MKQB"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-37d6ff1cbe1so1438341f8f.3
        for <rust-for-linux@vger.kernel.org>; Fri, 08 Nov 2024 03:39:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731065966; x=1731670766; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mx8IX/Oejjgsq+PXa5DoK6tONKLcry4AmnXKYd55j60=;
        b=WJY0MKQBYmZ9Kka5vyerqH4xmqaC8SiVReyF5uOzP77WyUSS4/yPYdmJ2g6uMt8ASC
         vVFbwmalBjretQhsEU+3Om4R8KJdU420zJZEWjoQcAuCWA6yjrsAnhlYR+dsEmYXT+UY
         z4QNNBmf/pvmAPPNZRg58p5zoxi5vgr77oLmxX7BFfBPci31n1dotBsEzs3wlOArUgJ3
         46A3AJUNAUkQNGtaduevtfNf7f4OXBqVqoClC1xYSK+sTP+t/etNTqKrhLXEBC6I54kp
         m8cx6MAkui528Rdxm6Bs0FT/p+utPlmEHaC5rHcNLAFjJwhxl8t+IHPszEB6b46qMSma
         oNeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731065966; x=1731670766;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mx8IX/Oejjgsq+PXa5DoK6tONKLcry4AmnXKYd55j60=;
        b=ZkL/JYv4CALqyOZByaTmr32PN4jjMoSGcDL+pRj18RLMf6cGt/R6ZUGayY6v+xmOwQ
         +wFp0adBp9nZ1INkL8vZdXoKT2fyet28ysg3S+uBIE1KWTBgVyLNAk/1Xx/1XnacNbzb
         acUDxBUlKW9qTEsHHPzN2lfI/U+Kv63rRTk66Ne6py1mZwXlnJ/kdiqGbykSeh8gSkEd
         iVHwE2+Ee4CfYNWYDmr7RPHoaqoBOojAzcTNKN5gLKErkGS4WwHTsU7FrlY2l6g9SPpr
         T9HPECogmbZvf8756FVsUMxzEXDGAm9shbca0xD3tkIUPvvI0gn1lEVd46B+Ur9S1ZaH
         encA==
X-Forwarded-Encrypted: i=1; AJvYcCWQ2QeBuezQ0XuiXJFdgX0a7vynQSWaWKroZHVwx35Q2vfZGDwRxP0OvNnhHCYCII83uxt2o/nW2HzoHxYbXg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzPQ5kH3FjjPjBEVDTni7g6VAwYNz765u9DBTxVn766m48IiazJ
	qARUVNGphSg6yCnSgy2JO/N88UQy0ivVzbDzodKEtmDY7OwbHOX08kqMkW9pnmCQeXSTTSYhD+c
	gE7hNGdNmQOuFPi4l/Hw1rKEfZ5ErO9DUEyVd
X-Google-Smtp-Source: AGHT+IFI7OOZ3/irToKMB1BSRu8XHd/lQMXK27V4DpjXJ4YB6jGF4yGw5i1K875+vv0vEWzSnGIKcWpJ7i56cMMkgr0=
X-Received: by 2002:a5d:5c08:0:b0:37d:324f:d3a9 with SMTP id
 ffacd0b85a97d-381f171cc5cmr2218340f8f.9.1731065965965; Fri, 08 Nov 2024
 03:39:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241104-borrow-mut-v2-0-de650678648d@gmail.com> <20241104-borrow-mut-v2-4-de650678648d@gmail.com>
In-Reply-To: <20241104-borrow-mut-v2-4-de650678648d@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 8 Nov 2024 12:39:14 +0100
Message-ID: <CAH5fLgjmVaGiHGkZa+hUmLfEJVQs7irNPamXJGu3Q-x8oPw2QQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] rust: change `ForeignOwnable` pointer to mut
To: Tamir Duberstein <tamird@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 4, 2024 at 10:20=E2=80=AFPM Tamir Duberstein <tamird@gmail.com>=
 wrote:
>
> It is slightly more convenient to operate on mut pointers, and this also
> properly conveys the desired ownership semantics of the trait.
>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>

Normally you would put your SoB after RB tags.

Alice
