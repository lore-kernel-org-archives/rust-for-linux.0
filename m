Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0359919006E
	for <rust-for-linux@vger.kernel.org>; Thu,  5 Sep 2024 08:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725523942; cv=none; b=FbScxuBeKrFSFvC+yAqBS+bBbvkNDnSGCTbjK0UgSg4nfPW9fSuFZpNR5SSCMM8uDXS1jFnqfVY04v2NjNQoFZJqD72N/TP0HdTr8smhfixv9mcdSG5wU30TRb/juD2cBH40Hk8KqNqxU8eDX6rRLmvxIKH+syC+9YiTVIcOICk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725523942; c=relaxed/simple;
	bh=rSIoNT2lPLs96YVVwRh5JllJcJJ2SY8FNEGfw3S1XSQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ujC3PFGXjesQr4tA0dnwCmpqTSVppgEKwfvpfvRXHdVaaVozpBt07xIm3KzGKVL/96R3PHHney+72teKMvThVzlmofaj3RFnNi0A8XiUClaspRfCpeIOsyLIjGlCWiqH30KKCJ6ccA5YFZU/++ezeFI7QvDz/j2xnVgj/8NdaWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=S8xiPHtK; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="S8xiPHtK"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-374d29ad8a7so283991f8f.2
        for <rust-for-linux@vger.kernel.org>; Thu, 05 Sep 2024 01:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1725523939; x=1726128739; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rSIoNT2lPLs96YVVwRh5JllJcJJ2SY8FNEGfw3S1XSQ=;
        b=S8xiPHtK5tNT5PSZhh1Jjp9ekK1+OnLY05p9jf4OnkYlPlwIhIZ4+N1HhNFthj480K
         aJ1zPCiJ0uXVIdORH/Nx5TAnc9sS/Wbx+mrbvwkXRjBFsFM/4H4c0OyNMIGBzxZB1WtO
         rrk9+q27m7Kyt39SUj+cbil55XoHskktXq/yBKdfBerA2s6UMzbFm03PF2a1iXZTetCh
         rFtrJhuYNvkrhXfUeQVOUaLxxMTa19hy4sR07N9YUqh4pXTwv5hunbEqgXGpEOsMAjc1
         kNvi0RYQqjlR+LzooOgvChdSA9iL1YY6xWYWHRqjCEeTQwaTkVK3Da4Sc9SuCp1J3pSW
         OvEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725523939; x=1726128739;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rSIoNT2lPLs96YVVwRh5JllJcJJ2SY8FNEGfw3S1XSQ=;
        b=cT1d0g2H4fAM3c6xh33FXxEMcspelZWma8WUBP/VGmuv03M4frs+GOe5c2TMVZkzeI
         Z9XTpgWHQyWUtPsgrYEN0TPxMvkWPwqZqltiTRFH//bJyK+c1rU6kkj+EpnjPJRA4odQ
         U3pF02GSuS2F1z2wPg15LtKg3OQiaEuyL48IDcCqdXLYxEIPatZYpKMEnbfirK86A8JD
         1sfcT7het/74fSGtlJfsP10qs3ImkFzer6WlmIh1x7wCWi7Bd+wdIeOTezQDefxLDsUz
         joUvpqUhIE3sagZ2cYHgUVj0TiXDENp9BpUSfhmPzIHe/2LJg1E0tTbNs7rEQw8VzBEh
         Of3Q==
X-Forwarded-Encrypted: i=1; AJvYcCUweGXUb+oxmpL/H3HWuLCQtwEwhLdEIjlGytLaaCqHiQDl94H0E9ikYxZcB8sZYEHbqJeCzN2ZIvR+QmB50w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwXHzaAVVdlrq0s6z5zY83a6O6+NGfjFO4WoY/qerU0g1SF9F4g
	iuf3BrVGZgARqi8wKH7MZhgO//i/Or7IfEvEo9hOxh8k126ar06jpDnqjFngmDi2VD3H+ySmIUZ
	d2uvOmBTatuYz1h/wtma6lVNgD3BNCDaQTdFv
X-Google-Smtp-Source: AGHT+IE62Epsi0v41kZrmq00wKSCQR34/0qV3MJKgYftCiq9+X1v5PTgR44xXkcmKdvrW/zHlM01xfs3FnBHh4EANoM=
X-Received: by 2002:a5d:424b:0:b0:374:c64e:3fe7 with SMTP id
 ffacd0b85a97d-377717f4f33mr3567902f8f.59.1725523939035; Thu, 05 Sep 2024
 01:12:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240904204347.168520-1-ojeda@kernel.org> <20240904204347.168520-12-ojeda@kernel.org>
In-Reply-To: <20240904204347.168520-12-ojeda@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 5 Sep 2024 10:12:07 +0200
Message-ID: <CAH5fLghOG3tSySfn4vnxU7v_Y26ZQcerQT7-4pUJZpYv1zGM4w@mail.gmail.com>
Subject: Re: [PATCH 11/19] rust: introduce `.clippy.toml`
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
> Some Clippy lints can be configured/tweaked. We will use these knobs to
> our advantage in later commits.
>
> This is done via a configuration file, `.clippy.toml` [1]. The file is
> currently unstable. This may be a problem in the future, but we can adapt
> as needed. In addition, we proposed adding Clippy to the Rust CI's RFL
> job [2], so we should be able to catch issues pre-merge.
>
> Thus introduce the file.
>
> Link: https://doc.rust-lang.org/clippy/configuration.html [1]
> Link: https://github.com/rust-lang/rust/pull/128928 [2]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
