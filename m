Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5114D1A0BC8
	for <rust-for-linux@vger.kernel.org>; Tue,  3 Sep 2024 09:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725355984; cv=none; b=cGFLqBIckAAIi+RQxHFe5qwsvA6zRXzsURGU8FzJjBy3SAnY4ms6m4a/QuKJ6hi0W6QDN5VBkTga8Y5pHzfsCbduACiKnJDu0zs7Qed55ofI2c7XO+DXPxlwo1PPaVzton+V8Wh1p15tAB2uBJ6W0PHsLOI5sTPBT/6JglQWWmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725355984; c=relaxed/simple;
	bh=c0vpnkUFsXef0W5Py4ezUBWDFZhRIoqpCv7NYgYYQwk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KA1xcNZ0u73fkY+cmdYIP83n0oZg5VGOAnDX+Q3XnaVWtW4KS7IEUBWayVP+TS3yWo1TYqWFI4pinD9DPHe02qf7Ja2M4uKqGaIMENwhEvUGANOHK3OaNuwDoF7fJlC9l+CjKosBy+AEn4aKQRr9z3ACXMT7xgpA+BMtE4E3FX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XKL6B4eH; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XKL6B4eH"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-374c3eef39eso1637119f8f.0
        for <rust-for-linux@vger.kernel.org>; Tue, 03 Sep 2024 02:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1725355981; x=1725960781; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c0vpnkUFsXef0W5Py4ezUBWDFZhRIoqpCv7NYgYYQwk=;
        b=XKL6B4eHIeffVTWkuAyMfZXP5GDZds1nyv+PdLojqYSO4xi1/THPFdVcTvfqHPqrlY
         HjwN/cZ9THbAh0B5SvAykNEoogzm6/KETPMkh3vZgOewrFaCWfCR20v9m3JpjyEViWDj
         wO0syYhjiRu6w/Gd15ijewV9oTTpvX+7Go2BdOzaOafwe+nwCZE7bGpViQBrV39x8b+R
         0oqLqvwpKVrDJa/kgFJImNrDTidZvfc2CAcQa34XinF5h7AMLvHB63MRh7zaTYRm5DwV
         R6lij9D8ARXbnU4VlV3JLEA5Y0bmVl4h56UI5WTNHVl4osIfgMooRvqg1Qbp5s7yHTlf
         gaug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725355981; x=1725960781;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c0vpnkUFsXef0W5Py4ezUBWDFZhRIoqpCv7NYgYYQwk=;
        b=bmLzjXxgsSOgVIbEQEhJ1K0n6XjQ6iRhsgqYyk6QP9D1B+Yb2kpoIw7R9IzdXKYjYw
         J3WiVci6haGFB+Plbh8rFwvsqRC/3njkfbv9bAOGvYbYUKOSZnX40qWCT+i5og++bqdM
         5NFJbB8DeG6O/fY48QYyyBZfVlG9/T3o1mrNmQKfMfqFE+9ChhYvCB9rENDM3xj0Zk0U
         uK1cH4VzqxIbt8teQLASCA9HTS1r12cwPe4Pf/1ecWuIb7G+LSJfG91Z2pPE+Rh8xBQQ
         KBrE4n+I5/GFEeDVS/ZQfyoSXkschBrg6W2QGF1vrvVdGpKPzbnXrCE4eMh6x5dvP1GI
         CvmQ==
X-Forwarded-Encrypted: i=1; AJvYcCUYNM/IVsANee/mP3D+tw7MrMVosXu3KosgNb5rUNTrxNLASmtaVuP1Y37yaB/VrofRzlbQWJr31DZ6pNpE2w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzvm4PRw1jv0v3RhrTQ2hFzU855iN4+cX3yCQesqD8Fu2go26BA
	C6zo4SMcnrw5+h/pLJDU5gqnsxyC8R0iXLO8xCtT+1EkyfFiwU5p/PpUd39eaUdOoiHGZfxHU36
	Zyb7K0Sd+q+Jt+yXv/n8NrIB/8rC13rUrqPz8
X-Google-Smtp-Source: AGHT+IFQ0z3kIL0B8GtLMicNXuU28GUFcpTGLSuRcXdc7yD7zpkP/Wid9apTohJEbl7Gvgav4b700RAJ9aY8EZQNvYQ=
X-Received: by 2002:a05:6000:d8b:b0:374:c3a3:1f4f with SMTP id
 ffacd0b85a97d-374c945c72bmr3961888f8f.24.1725355980208; Tue, 03 Sep 2024
 02:33:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240903091700.172734-1-benno.lossin@proton.me> <20240903091700.172734-2-benno.lossin@proton.me>
In-Reply-To: <20240903091700.172734-2-benno.lossin@proton.me>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 3 Sep 2024 11:32:48 +0200
Message-ID: <CAH5fLgjicT5O77UviXUPxc0-O7nQO4J+M3Nfo+6Mm-DVGQBhMg@mail.gmail.com>
Subject: Re: [PATCH 2/2] rust: sync: require `Sync` for `Backend::GuardState`
To: Benno Lossin <benno.lossin@proton.me>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@samsung.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 3, 2024 at 11:17=E2=80=AFAM Benno Lossin <benno.lossin@proton.m=
e> wrote:
>
> `Guard<T, B>` implements `Sync` when `T` is `Sync`. Since this does not
> depend on `B`, creating a `Guard` that is `Sync`, but with `!Sync` state
> is possible. This is a soundness issue, thus add the bounds to the
> respective impls.
>
> Signed-off-by: Benno Lossin <benno.lossin@proton.me>

Right now, a `&Guard<T, B>` has exactly the same powers as &T, as the
only thing you can do on the guard with only a shared reference is
deref to a &T. So the bounds are correct as they are, unless new APIs
are added (which seems unlikely?). But the safety comment could
certainly be improved.

Alice
