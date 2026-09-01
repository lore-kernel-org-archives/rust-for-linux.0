Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8864D384CE9
	for <rust-for-linux@vger.kernel.org>; Tue,  1 Sep 2026 09:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788256109; cv=pass; b=TmhS0dc8vIqS6pXYGfql7w8f2JosVTZ3EJimijlGJHDfuaG3Ydn0KrLePVvKPIZjgfKd38nz/XUnIF43l4M9rSazncNlIph4MeOCAmxjB1sD6WOjVA/An470eGa/M50oezSLOot8KhROxsviR1x2A8VmlYH5LoFkWzxmHA40nO4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788256109; c=relaxed/simple;
	bh=TFrGWGX0qCMRg3Udva0da7KMgwurIr7BvnyZ8jdwJsI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AcluR0+EQqAcFEoL9G70b7epnqzeSDNVKB5xgl+c1QA8ra7InWxlxat7jbamlS1zhdZLRAeyaYY4vyfNkeX+jeenRhEx5XhtojnoLV8E01R17aQmhfuz7y7csiMrhUlsrtnFNkECNhYq38nzArBo07pj5M+MmALkbwO8miBICFY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ekDHRyjc; arc=pass smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ekDHRyjc"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-38f57e312ecso1018342a91.1
        for <rust-for-linux@vger.kernel.org>; Tue, 01 Sep 2026 02:48:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788256107; cv=none;
        d=google.com; s=arc-20260327;
        b=pCYXrz+OXH1eiFS6N7FBkZEK25C1PHiTZY4sTZqSlrmvmMs/PInRIQNxfTZ368Vmei
         k7NCQOQzTjc7FZWUrA0fZAIXtlRHV8OMhtmfV3WNYNYi3+6Lp8jV/kMbzGZpwlh53C6M
         Jc/uD458JjGljPOZX3E1mtIYkhj1V2EN4JkpmHdaj3cwRPU/QT/zpioKiJuAnk8OhFSo
         rFfSlut9jTx/od8DwZLxPuGdl9blBb9nV6CGatG5puOOYALz/KDG9hiBW5GtWJ6NQ3sS
         O/QrkRwjd2PUSnbsWYK06ZyxbAhiUpj3LjI9mT5HE/jUtwJcVijtaetr7OgHI5xngzpv
         mwAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TFrGWGX0qCMRg3Udva0da7KMgwurIr7BvnyZ8jdwJsI=;
        fh=+yWTzj38AW8jOH73sC8KmNNJ3OiEco6ZXBcP7dM+VpY=;
        b=IJoNL4cw9+kc33oHvENvINlfroCnblmK24q6WcLvtCUZhkwrLOwyxTSIPKe/8Ej+Rp
         kk9+QElQ/O9LEHmb4fqeJKH1V/6uKwegCY+zW5/0C6Uk1n5fbRc0TL1CgLGvRwVC1gwu
         Cs4tzKFWoUoMziosEMrBz+iyKTwkw3PR5NGE7hPF3zABMIIxx+lo+8ZkW0Sg4DzVYUw5
         ScigxIvMbE2nPeaGGWVf3EvA3sQW+G6ZIpY6iBeBM5L0Mqy08owQiCrnlJkODECGXvFH
         9fPBG0BehX+EplwRCTbid57OG257PmdVmuvfRuwYJ1S11vxw6/LTI1ZmoPYLBmXZWKOy
         XeZA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788256107; x=1788860907; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TFrGWGX0qCMRg3Udva0da7KMgwurIr7BvnyZ8jdwJsI=;
        b=ekDHRyjco7iu0DlNb73FH9CcuUoBm5GUuAxdLyUtbIgGBzh1SF0FpkVle8n5fSSwux
         J/0X4UH8f88okINWhT8vRP9C5cP25Rgz4qXwmTJLOYccvRx1Ahe41cLn8rCYTiXQ8aY9
         rm+BFwIEV+61Vj0CNu/O+CdqGA/glw9Zcg30KZ1Hizxa2E7Z0c0n3ZIS7wZ058W+C5Di
         47FcX3gBrJWZnAbQ/KgK2QbYNAngrpneVdAefVd3KdDxgcGdJF+4Tl/PlYgSehU0Vp1z
         O26kd/cUDJX8cMfmfuHhMU22RhpgnCfwoUxs9rpUtvzzH2ouaVN6mPzrtGTquLGOLsYo
         vyTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788256107; x=1788860907;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TFrGWGX0qCMRg3Udva0da7KMgwurIr7BvnyZ8jdwJsI=;
        b=SFKCTWJAOQ6qB7S/FtDlepr9KE2TBTOx0f3DwxHcRzL5E3s08y97BaPhJRXy8xaSu6
         R3+DQrWYWphJX0Brie1eLmxfN3vpbOcXsFUwyxfsyX/CcZqXJa0O4VugsUWmZkhTjczn
         qVBxLvA9eZ0isRXLFW0BE2uEKxM61tmYp3dl418fXaTjgulqFlCilCj9/PbsaJv7Yoqm
         l6/TXNr0n7/kNoaYIigLj0/mKzWLw7YKG8aNKodpWZYsG/QFakEqpL8c10LEezQFQ4tL
         XQ1V0o0XCGHJ/c8fI9h1oByKA3SAZMplmqKwMqOgsJXAipAllz2yomcm9MPVrHrezlTL
         J77A==
X-Forwarded-Encrypted: i=1; AKwUvBy1v5dRrGKBo7HiEnpWhgVRhGU3FAqH1qEEAKC6sIKVb+JDWzac99raYLOTbxe7Aq/oflq3qoJJ0+/lMYbznQ==@vger.kernel.org
X-Gm-Message-State: AFuF++kPBRLbQU8B14d5lj/VERYm166x9/C7Rk22MNqXx+5KE254vMO6
	6X97k1iDcrMArqpk9a6U60Itg+rfflq98+FzjTeAp3K8znrFhfVfCe9WDkowzw/DWCbgonQGnLj
	SqKKxZWGOoqaULWSfXzjRWkhQYyQPfF8=
X-Gm-Gg: AYBFou1CBbYtfB7NlNddxQ1U0GXIvAoekLv72xnBxo1fLUxsmMep7GBbMZRaw19iHVi
	asu6WMnCFVhqiTEBvvQ9h+PhH8Qq81NXKuXNiNRMeveg7qt4qekmvVZRIQ/vYxHg2r5G2Kv8eHX
	BQIcAqiB8aJhDA+RDY3tqza6EvgdE9ao9RJQyaX2W1wfAnsle9Khjmmm9Gs+9H7oRxJAC7CMtfj
	UWVZiTESVLNJrY8ZM29P/OcQyHtHLLj4LGnBnhzrFsCAfScK2vUfb6G2RnQf8lY/BRz10SoWJvb
	ttRRNshlGVxxqyLge49yqyd2zuby5LlDmmnueYOEYVOU2j+8URnfTd2cn2zmcm+J9Uln0BshNU7
	EX8BLJCdiRe3Q2jU2bRtHT+OC++skJX6qG+vAe2ZilX3NVYEWwUL7PT1pD0DE
X-Received: by 2002:a17:90b:17cd:b0:396:d27b:86a4 with SMTP id
 98e67ed59e1d1-398bab2710cmr16901480a91.2.1788256106694; Tue, 01 Sep 2026
 02:48:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828133543.2259029-1-georgeandrout13@gmail.com> <DL2Q7DG3HIF1.6IU0VQX54L2A@nvidia.com>
In-Reply-To: <DL2Q7DG3HIF1.6IU0VQX54L2A@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 1 Sep 2026 11:48:10 +0200
X-Gm-Features: AcwNN1XVIbAOkbhlLBnkS2GohT29f8zxOg3ydr9xAyhsBXgZiNdFLd_6swEjYYY
Message-ID: <CANiq72nh1MtnUU=sDVjRAEc3DxAmKcd21cdPohPwjDizujngFg@mail.gmail.com>
Subject: Re: [PATCH v2] rust: bitmap: document panics in `next_bit` and `next_zero_bit`
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Georgios Androutsopoulos <georgeandrout13@gmail.com>, Alice Ryhl <aliceryhl@google.com>, 
	Burak Emir <burak.emir@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Yury Norov <yury.norov@gmail.com>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 31, 2026 at 3:08=E2=80=AFAM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> Should this be `Closes:` instead of `Link:`?

Maybe -- it depends on whether we consider this kind of documentation
hole a bug or not. But if we do, then we want a Fixes: too.

Cheers,
Miguel
