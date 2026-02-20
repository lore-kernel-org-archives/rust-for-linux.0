Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 252C932E121
	for <rust-for-linux@vger.kernel.org>; Fri, 20 Feb 2026 00:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771545618; cv=pass; b=OmyspwNzRxT7cGwvjJa+s1e0/dBUFikFrGnoh/51x+IHRq2rPsGudhbNUe3zP/Z6OpGINiRaPKddzy1Eilf+1t5VV63ubZ8bTGYpw0D/VX6q1OKJqGzMCBdyQp3WYIFdphcXKHpqIYlVYSfzfRmpPDM44oaYMNHUfhAc6evX6WM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771545618; c=relaxed/simple;
	bh=d21yEhqfzh8zMrqUE1edOExxeM5FU/XoUziSunkEo6Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uymFEm95fecQEjyiafntF+R9fRQe04eqy/wRX0fI53rObjsvfDd/OeGK1pU7B9d61m6yMhhXvbPwXh8fmXDtVgtobztnB3kSWrs1A8FrxoAycbeKzOs63t2XhRn8sEPh/znHWYNoC7Q2EAq6xWa3sQBbTjY++h5FXrayEKx/wz4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=R88Y0q8z; arc=pass smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="R88Y0q8z"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-c6c444e89bcso588026a12.2
        for <rust-for-linux@vger.kernel.org>; Thu, 19 Feb 2026 16:00:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771545616; cv=none;
        d=google.com; s=arc-20240605;
        b=b0c7SJCu7WYe9IRumzf1HzVBzlT+max6CSTJPPXOyc8+T9cFgM1JtfgvhqouqYDFW5
         5oXdLI2XqTT4UWH0KeXG2PRdVGb2Z3B2cmRrZku/TxW+MpNdAsxsLaKDnNqUNJJ7ZDhP
         RBuYHZc2nkMxWDv0MlyIu53nksPFP1y2DgCAgAGo5oMo94ckrXl/25eV0dkHMfYKfKtL
         YWmxky0+LpadgqKDH7cxlbwevY/vrezpd6UAyD71Rc49NSnJzG7ZwjcD6lzIRsDTAMTo
         +goTvP0z5o6N+7dOX88F4teCRwhai7i3Ce9YPIudo5blBvmp3OoFqGqyd1XqyH1N/4Yj
         b9JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=o36/diJ36lG8KI3DZxLKNWURpWjbyhgAwYq0XhyOvXQ=;
        fh=uU9SIoGvcOCepStEI2VstXxE2cgeNS/4ntvO/wuH5P0=;
        b=QcjUepUJVNZy2BrG737bmp29/hY26uoOTAlBHTr7Avzl0t4054ln8KVdg/sUZseSfw
         qV6H5yaquMEhjfPlpM3+bde6Xl157IiHSo92y9jtMutZAVTigSYTcKknBAWyzMs0Qq1e
         e56MM7yfHSbB57RxkNXAhB2jfrUlCkwk37z/pIi87wkxz4zTXOlvBMJQNrs3ZTZ2Bx9O
         Xgy562g1Jg9vqrkmJ1FspdQYH7J5PTM3zmNV68wDyB+f/kT4BHBWWHPFKncDpjjwUQBc
         oGtriaSNhOHjUc5YmQvXSqJ8G0dveIbiUKMjE1yXoQsSKzhU+QYi3QpMyxzZTzpublvV
         dw7Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1771545616; x=1772150416; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o36/diJ36lG8KI3DZxLKNWURpWjbyhgAwYq0XhyOvXQ=;
        b=R88Y0q8z0dHcUQAjhtFOXxB0v/Ng+vorKWHgapGefvZBQgIj80kHHJYEmz/Hu8cj5g
         1FkoZxpF3jwLYVz+/VSa1BVR9U5lSfdUF/yFHRAKfo7AkW/L7KE44y7q6dM01iq7WuXx
         x03Fa8zC8rsZLVBFG0l1WDwScTLw4vEVAcfZAIi1HvWuXiKXCGNZb4gMqwuOJrbi0BGY
         UuE/iV553N4Ph3As94swqTEcdGTKLNmwnD6S0//kuBCoWkjRSnZETJKEgc2/hDFVnpRF
         3XMjdq013lH7ZuTpXRbuiXHRj3pyOSrgmLLJT0x9pPSK0f/Fgb7qrppNT7++zXnWboeP
         896A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771545616; x=1772150416;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=o36/diJ36lG8KI3DZxLKNWURpWjbyhgAwYq0XhyOvXQ=;
        b=eNVidIC4vcoOPuv0TmkaEmcuj6sIIE6+kaVQ2t0ZMDYWUjkiyA6AxHJrF2OQijOwb/
         LpPPQ4D4bGERItZzZk23H2VkoT0GcGCESAjldChF/Ylmd31ktSNZMsAKZ61oJtXhLVuj
         81PTR6FxZx6tLAbEft+vyxBc1QjMS2pdhhjmuMJyvaWPdAjG2u2BWZvsszJZQ/jAfIT5
         KR3IZNsddeo7DCTGXCT/RDomuVdD1hSfs1V/CpmYaHu9U6952sSheT1VD57Rm3KhZIFo
         9cYGq1zEM1W634DtC/ug+q8kFZ/P6FbNelUlDGYtJXvs+DIJa0vecGGTLl83vmP+wdB+
         JZvw==
X-Forwarded-Encrypted: i=1; AJvYcCUUIXOxKFrPM0/y3evqVyYH2rLifTGV/HO4UEcX2OsxPwx819LCdsX86kb6LFyiTvc6Rgl0TJjsihnHoYleWA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxESYuGzbANvZ2/cYczrzexdMPam8OG+MqMainJrIVFQUZ6VYFF
	LXl77g9jXEQG2yge2Q+YG9jwdI3jTgrFxiqh7w+S8OaXxHN9T8DRokV1pwDHg6kInlMRBQqEF9j
	MAAGJv71q3r8sI0pzoej7hGHHfk9dLZ9wR87XpzP7
X-Gm-Gg: AZuq6aLyimtBPXKb0SJXbZ8lyVX8c4v88ahEeUmjGDDuZk3hoMMchOQCOGvAhP8q0zc
	1NcO1vQmiCo4iNKoeCCN2HF8xvEZducLluihVYTo9kRIgtHiTB9d64k6RCxew6KRO9qyzO9wzA7
	E2ijRQsOIJ4FtRP1slkoeoIm/7+wh8A71R3gk7PkGEDvFJItgjFlWJNI1uad+bUIAsOmI92MeR/
	Vw+18rCF2zCOeP9m+5YfMk0mVJr1lNgiPA7Y0fcxviMBfFkIDlZtejIFK/86pzlU5IhY8gp4xiE
	vJq09Hs=
X-Received: by 2002:a17:90a:d890:b0:340:be44:dd11 with SMTP id
 98e67ed59e1d1-3588916c4d3mr5800139a91.27.1771545616313; Thu, 19 Feb 2026
 16:00:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260205-binder-tristate-v1-0-dfc947c35d35@google.com> <20260205-binder-tristate-v1-2-dfc947c35d35@google.com>
In-Reply-To: <20260205-binder-tristate-v1-2-dfc947c35d35@google.com>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 19 Feb 2026 19:00:05 -0500
X-Gm-Features: AaiRm506Y2kfbsAw5yuSy39Cc7BbQ8GnxyExl_UwkT36VTmOrXmenuVrilx1Qck
Message-ID: <CAHC9VhQP3jz-RbdZczp=FVHphu55ddojEmjkh+U5m02AdPiDJw@mail.gmail.com>
Subject: Re: [PATCH 2/5] security: export binder symbols
To: Alice Ryhl <aliceryhl@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Dave Chinner <david@fromorbit.com>, 
	Qi Zheng <zhengqi.arch@bytedance.com>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Muchun Song <muchun.song@linux.dev>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, kernel-team@android.com, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-mm@kvack.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 5, 2026 at 5:51=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> wr=
ote:
>
> To enable building Binder as a module, export these symbols.
>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
>  security/security.c | 4 ++++
>  1 file changed, 4 insertions(+)

Acked-by: Paul Moore <paul@paul-moore.com>

--=20
paul-moore.com
