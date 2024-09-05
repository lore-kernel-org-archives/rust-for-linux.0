Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 972A0194AD1
	for <rust-for-linux@vger.kernel.org>; Thu,  5 Sep 2024 08:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725524084; cv=none; b=k2GTUH1/jClB0X+C52yGESjFxs4V101mSfVRbL8tdjx2ul1QdpulzRvkHz4e8JLiMjJk4zLnVgObdJt77k690CZNoFoFUTledOQbwZOZRexrjMIT4OA9bJRPTuaZ/Xl9Yf+zcgjFkrDlpmvm74QgssdFDyAwxHzAbTjxTAlJ3LY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725524084; c=relaxed/simple;
	bh=4Z7ZM2Zqsf7stqQxw1qBOI8mLWWVIXA0qh6UQvkxfis=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cjwRwD19/Ng2EHPvXiDxmvjH8xoVdINtJVWTC2SSXkP6ZtXGoPoSiuSGgIhw08ElvQzQoP0mZA3unPvnei/XpE28Yg2x+6Psi4817ueZo8IaOUGscf0UeaBLZVCuT/c0S7T3oyF9ysGbTknH6p7TAMJ+PTG4DDCwVLB8qi5FSQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iBTuuq+q; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iBTuuq+q"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-428e1915e18so3217935e9.1
        for <rust-for-linux@vger.kernel.org>; Thu, 05 Sep 2024 01:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1725524081; x=1726128881; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Z7ZM2Zqsf7stqQxw1qBOI8mLWWVIXA0qh6UQvkxfis=;
        b=iBTuuq+q92PnrDUI/KzUkUAaFV6Wuu5BqcmwnebxJY3KG/2qj0tmLXq3nlS086TNvK
         Mdudi+X2qT84jfXsYFks1u+6jBBUTPi/Dik938rRf+RhZgBruhsi1ImsbwzXx5KvlREa
         1KFDiGBDf+95CK5Gvp3S1ibVtYcZV9f72+eZq7YmIq1I2cgwS2QffcwiPYlSiRSWZUhc
         7W37rsCWdFC0VtPuqUcBlh4Ag9bhXb/M4KR3N6jW3O1kC+TfPMoqzCwSKF/+0Oq07BqR
         c/4Qkiu6XHBPjy7cIhJYhsS60B1mdElufMC8gP87719iyfgAFkTpRz5yPicRJCfmtvyK
         xWZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725524081; x=1726128881;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4Z7ZM2Zqsf7stqQxw1qBOI8mLWWVIXA0qh6UQvkxfis=;
        b=omXlrIhhYqb9dLL73w7C7nqQIa6DR6Rxq7GM5I2S+iJkb9sqTKp1CiAbejUGC6L4A2
         BFS5Czv4twasDDWb0h1sTxdeLOKGlymlT5LlEfkKPWQXLHPwqNCPIEpM5+xkGvlxNzrt
         9plrJaQgEdHgTiap5i4V/PskF0/keXHqihNqbNAdQgZCpwlr9UYE8G1GbTP1G55Fh0DW
         JSzzXgineiO/JTcQOFH6FihWJMS5v2QAjdML7aeZE/aXBTo1qKQ8NZMnh54l2h8XyPUD
         n6dSIwpfMNM40SFO1prs0qCCAafpInzdFgmqaH6QQ3edTY34Q2YcTesx64VN06eaOWv9
         HBXg==
X-Forwarded-Encrypted: i=1; AJvYcCW0KxTE46guHCLMe90LfuQbbcsrcLDyVX6pnBMoMCGwwLLoXsdFxHQyzUaGETv2FmZ5OY9RvCT4Nc04QREZiA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7yJlRliG8WW42swC4rH5q/2o8b92PClu8LvNdi17sh4zW2Uek
	xHEL1Ew/hIbe43q3d6XZtEe7xDy9xx6uVCCnfwsaLWfMmy2/Mo6JTP9hOo6ialay8GUA3U1dVGE
	D4SAlwQ/njbTKgyGu9kY2u3/pYsA5HC1Nz/v2
X-Google-Smtp-Source: AGHT+IFoFMEFG++KUV5iQ/Tyfkl/lsDMQem/o0J6AzcE+fLX1huKPxyQpwstvU5CcpYtGKJwWga2u5zlwmR9qabq4Js=
X-Received: by 2002:a05:600c:1c09:b0:423:791:f446 with SMTP id
 5b1f17b1804b1-42c7b59e335mr112875365e9.7.1725524080520; Thu, 05 Sep 2024
 01:14:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240904204347.168520-1-ojeda@kernel.org> <20240904204347.168520-16-ojeda@kernel.org>
In-Reply-To: <20240904204347.168520-16-ojeda@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 5 Sep 2024 10:14:28 +0200
Message-ID: <CAH5fLgjnX1hF6OSJco5xce1Gmd0brSLKDbmotCPUmOXa4UChEQ@mail.gmail.com>
Subject: Re: [PATCH 15/19] rust: enable Clippy's `check-private-items`
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
> In Rust 1.76.0, Clippy added the `check-private-items` lint configuration
> option. When turned on (the default is off), it makes several lints
> check private items as well.
>
> In our case, it affects two lints we have enabled [1]:
> `missing_safety_doc` and `unnecessary_safety_doc`.
>
> It also seems to affect the new `too_long_first_doc_paragraph` lint [2],
> even though the documentation does not mention it.
>
> Thus allow the few instances remaining we currently hit and enable
> the lint.
>
> Link: https://doc.rust-lang.org/nightly/clippy/lint_configuration.html#ch=
eck-private-items [1]
> Link: https://rust-lang.github.io/rust-clippy/master/index.html#/too_long=
_first_doc_paragraph [2]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
