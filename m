Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 434AF2222D5
	for <rust-for-linux@vger.kernel.org>; Thu, 17 Apr 2025 07:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744874986; cv=none; b=K4+ncEBienrvbLHOhk8skLyErCzt8NNTBzHq6hLTZV7T7TUCjBfUk+uM3Ax6vdkMPDsjGjnIDykVINPkiJqI66cz0hOqUTM6W6k7+sQYT+ofYmwLC/jewen1qacqeKX4Ew3q2qLo3h+Evqs6Uav+QErOoR7BH1myFpcFqzhhReM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744874986; c=relaxed/simple;
	bh=K/qVpexqYbGXek8rsi/iSgFhcrSQsxTDhXl27B5c8j4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R5/ko9R2nEZZIt+AkMrSzXtMEB25L2F3CBB2sWz70LJPeaONReIZaJm0JTA8Tq+X4H018owlvmi0XodzewaaN9XTeXaOcoFChwOnavRy8YwczcoiKKPeADtRVf4UJb9aQs3d21THY2XuIKY3Y5W0KuoXLGY699lUh/plIplZbMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu; spf=pass smtp.mailfrom=umich.edu; dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b=RBb5SQYY; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=umich.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="RBb5SQYY"
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e6df1419f94so411182276.0
        for <rust-for-linux@vger.kernel.org>; Thu, 17 Apr 2025 00:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1744874983; x=1745479783; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6sdswscRqe1yW7y5BvcZg/klGUlosalFpleKm33UkAE=;
        b=RBb5SQYYguCTCu2QA16EbuZmItc2s/00aisiqtZ+0kFbsRmHt8MFgvKkklzliBLlD1
         zBO9yohQx/tB1T8mmcdUzA4UOhjmoSBwU73UiUSfgYpMUn0R5uBPKDLL4gbwagrM/1PJ
         uUK1TRssKOGmXujMZ6kx6OHHHS8x2KTJpoxEz7DbWUwBAdg7sg/m/zFC3bFdwH+UoiUQ
         KJ0ptoJDvDPHJHN+1NPkRaxtBAJ16z1866fYnOhlw2tcfEfVjvOiksn+cFuVYTtU+gMP
         n0F91KRQozu8eDyRCfgsHs1qNQtnKeeR8s3/pqWsJhZ2ohOyquMgclrCqTPj9b+3KUF4
         D8cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744874983; x=1745479783;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6sdswscRqe1yW7y5BvcZg/klGUlosalFpleKm33UkAE=;
        b=HS3aowgHIkX6qKX5+Aw7y84Z8zi9vADYnOm+3ostsbHx7RAXXUyEJ5KQgbKS6ajdnx
         dsct68IktQBqHXdIuqRy+/Ijy9r7+higfu2jlemHFHLlF5eEeHOfG4KvQa/E6xmHRM+8
         hSPkPVeW52SoYMlIz37gGyNzuce4Wi/odaMBFj/rACI93x/WzJhb9gz21/5SbmcU5VC9
         Gi4Czs4WJ/Wg9jj5AWkdpoB1VJyRUEYlw1lLg+85P2qNbLQy8SXibRN+cg9BMb3x92Rm
         1XGsebEDjqwxqNmS6HFiiyjjiwBUXdDUXSFY/nYh+OzekTG9U5uobFEXw2D6B+yq99Fz
         CKEA==
X-Forwarded-Encrypted: i=1; AJvYcCVPbJnnOWg8N5gS8tZ2MOAc1gPjlrCnQqdgh/vJxHBeXE/5jUcThkSCvdKZ7CLw3/etK63suq+tOuEbgkUikg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxbTtf0thF8ZfGirfrRdzUMcvHU4ZDityCArCjt7aPiojfUhhYu
	tvT519ivMJNOrEGc2ZK0kHlijQy3oWdHsNTQQE8BybEwqFkPTVxtqWtH+2u1jWwMOEzpFdjdkcH
	xVgxV8jueCbYQNNE13152v5N1vreFA4iPxoIF0A==
X-Gm-Gg: ASbGncsUC6GCtOPLbs1cH5JdFloSIHzxpnLUyiuhQLjJitI2uj7z5E2TvuHkBfeM+RR
	NjBVIrMGTNyKXT2BVezEd2N/tiFj9u0i5V1wRSOBjEwsv3k+FdrDVCE9gQc2BNWJ/QtdziwdHaA
	k8mDxFgMjLGHSEYJ9fpac4DFmOgJBsCjto
X-Google-Smtp-Source: AGHT+IGbOI+9U6l74YzClk9QomxdTqqVVocR6WmIp0kqWQtPr4v8W3DR3C1wutqtZn8yUYm5l4u767tNn1ysOcZHY4o=
X-Received: by 2002:a05:6902:4a81:b0:e6e:7c6:fa81 with SMTP id
 3f1490d57ef6-e7275767c3dmr5664173276.4.1744874983260; Thu, 17 Apr 2025
 00:29:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250325-rust-analyzer-host-v5-0-385e7f1e1e23@gmail.com> <20250325-rust-analyzer-host-v5-13-385e7f1e1e23@gmail.com>
In-Reply-To: <20250325-rust-analyzer-host-v5-13-385e7f1e1e23@gmail.com>
From: Trevor Gross <tmgross@umich.edu>
Date: Thu, 17 Apr 2025 02:29:32 -0500
X-Gm-Features: ATxdqUEKOs5h3u0vR3kD87bobI1DuVcz5z0BzyFmEsf93B71xJfj1MtJRSpRSYE
Message-ID: <CALNs47vcB9A7Q66Xvh+_dQKkn5PE6BSw0VpO1S_2KQQ_p5AVSg@mail.gmail.com>
Subject: Re: [PATCH v5 13/13] scripts: generate_rust_analyzer.py: use `cfg_groups`
To: Tamir Duberstein <tamird@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>, 
	Boris-Chengbiao Zhou <bobo1239@web.de>, Kees Cook <kees@kernel.org>, Fiona Behrens <me@kloenk.dev>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Lukas Wirth <lukas.wirth@ferrous-systems.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 25, 2025 at 3:07=E2=80=AFPM Tamir Duberstein <tamird@gmail.com>=
 wrote:
>
> Declare common `cfg`s just once to reduce the size of rust-analyzer.json
> from 30619 to 2624 lines.
>
> Link: https://github.com/rust-lang/rust-analyzer/commit/2607c09fddef36da0=
d6f0a84625db5e20a5ebde3
> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
> Tested-by: Daniel Almeida <daniel.almeida@collabora.com>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> ---
>  scripts/generate_rust_analyzer.py | 19 ++++++++++---------
>  1 file changed, 10 insertions(+), 9 deletions(-)

> @@ -76,6 +70,7 @@ def generate_crates(
>              "root_module": str(root_module),
>              "is_workspace_member": is_workspace_member,
>              "deps": deps,
> +            "cfg_groups": cfg_groups if is_workspace_member else [],

Does r-a just expect cfg_groups for workspace members or is there
logic here? Maybe worth a comment.

Reviewed-by: Trevor Gross <tmgross@umich.edu>
