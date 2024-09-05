Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F9411957E1
	for <rust-for-linux@vger.kernel.org>; Thu,  5 Sep 2024 08:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725523695; cv=none; b=b7Qi06qg9ZhdiXA3hbbqobM3WdSG9VueVKFHp033VzDlYfrXk/XBN06nPvpmrJ4J9dui4PdRHePtmbHW+cAoy+4QksQomS8lVSFVC6btKjgZAf3hoyTN3VUS83LfRdCPiyCjsjbx2QfioHZL3ihoHuZ6YFZ8d5M85xsRJtPyljY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725523695; c=relaxed/simple;
	bh=poBaygU7+HWiLDKkFSk+8ccL2GmYFP/9Qk2v9fz7F8E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ay2p1P7CkL5aH/V5kjMK7oe4/mBWcsRMBTgzGTZ5zpOjmqXV0el7ws8QSviauMd0vwBjCxUwPuZe5etFOxOpcHWBWnzAfQXE2lqZ9Bu9hst1H9m3uyMgHqz71y9/eRmIWrTBaR673Lq0epFqPjqJsUR8KyGf1E+K3VaDfTrNSZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QTVNt4PI; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QTVNt4PI"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-42bbd16fcf2so3361255e9.2
        for <rust-for-linux@vger.kernel.org>; Thu, 05 Sep 2024 01:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1725523692; x=1726128492; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=poBaygU7+HWiLDKkFSk+8ccL2GmYFP/9Qk2v9fz7F8E=;
        b=QTVNt4PI+lbLVEOccq+YXoTqwglUFO8ZHVi/fJ/cL+Qwz+R61oITHO9AIfiQEHhT5d
         7MxNKo1iMpg1dhvhzv4i8Am6j/XGvCEK5jScxuEUE7Eep7hSocUDf3saQ9EL4wEWuxcL
         nV+6uyaKKmdOcM9lzjvQY5vFhv7R9mrArsNihqu70G4nkm35Efa1u74XXkIPQIUvcHm/
         j8K7vW2BbO8AUx35ilfAN8YdU3Ap+/uNl37TcyX/MVvqKjJzz9HRm5Bp5fJKZhXmC6HF
         imZhpy520k0QPlsb4eFXBaCvlkfjEJXagXMIgbU46k0jHcs9rRsw7ZCjT+StCPz++q7P
         CRXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725523692; x=1726128492;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=poBaygU7+HWiLDKkFSk+8ccL2GmYFP/9Qk2v9fz7F8E=;
        b=ktI+DU4qLX8ewBwdOQkaZED0wwILXKxAPkCUvm5ZRX/rKPYTrKD1wZF6Z0x8/QdmQB
         BbPLBX3fp3bMNC9yLb97KNp88JoKgbP1oFFSpdVEgJx06+mvqX1007mkNO8yogcSgzKi
         lVBtGZorZH1MA/U7lAlKxRKDhPEOYkq8PSs5fwkMuepi7slNSljY3ddP2/G0OLX9NLeY
         47+rypAvVk+V80hbfPwiQECxAvtO9ApxfF+h83iGGIkJQsiX6NwFSeM7f3gfBiPezin9
         XPNdNLVBZvmy/T7llYVpiT34Vw8TRNh1DNM5RhfbPjVsIjHUXRQit6tsHFxiFTbqblm3
         DHVw==
X-Forwarded-Encrypted: i=1; AJvYcCW19LEvTk////UPYK16z2K4bSJ2tYDxxpdu+hK8fqIh17r29elzcaSgruxe+lMGsbD9J9zjMNsxXAzls/q/pw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwYbgNN+vUD71KP47c3KN36t5ZgIClaHHO+T/KOYBdBO72y4b9d
	3WhZH/yJD4/eiSSvPRMXu0e18Ht+Jcb0C2QFg89TkeeMrpttEk2BWt+fftBFER72foX3KfgsNto
	20BwlwLFWpuwCxpKgQQhXVSoYibcxrnYGlo9u
X-Google-Smtp-Source: AGHT+IEQUylIRonA2uVlZFEoYTcRptbEOhXQeLWztRoXVHu9gmPqIPrVqsbgBqz3oJzQ8miyvaRCKs04O6ZvMsW8VkE=
X-Received: by 2002:a5d:40c7:0:b0:374:c05a:4046 with SMTP id
 ffacd0b85a97d-374c05a41e8mr9249377f8f.19.1725523691535; Thu, 05 Sep 2024
 01:08:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240904204347.168520-1-ojeda@kernel.org> <20240904204347.168520-7-ojeda@kernel.org>
In-Reply-To: <20240904204347.168520-7-ojeda@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 5 Sep 2024 10:07:58 +0200
Message-ID: <CAH5fLghKkzUpt0zDQVdpZCeUYRv+kUXCqkS7coUpFtaxNk7Bjw@mail.gmail.com>
Subject: Re: [PATCH 06/19] rust: enable `clippy::unnecessary_safety_doc` lint
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 4, 2024 at 10:45=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> In Rust 1.67.0, Clippy added the `unnecessary_safety_doc` lint [1],
> which is similar to `unnecessary_safety_comment`, but for `# Safety`
> sections, i.e. safety preconditions in the documentation.
>
> This is something that should not happen with our coding guidelines in
> mind. Thus enable the lint to have it machine-checked.
>
> Link: https://rust-lang.github.io/rust-clippy/master/index.html#/unnecess=
ary_safety_doc [1]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
