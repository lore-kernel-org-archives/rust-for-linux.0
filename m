Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B078831E82E
	for <rust-for-linux@vger.kernel.org>; Sun, 11 Oct 2026 16:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791735646; cv=pass; b=St4mfDGFkOyTMngf26/AVx2vjVzHS3RtApGIHB3EXDY6/qXS/ve5COmjmYZDH3gwZvozi4DGV8oGTM9NsO7t16KZGEc+EeDgT4GnwGDjEKIS8nqZebOlKfReaX8lJ9nbufbC7mgkjeHh5vgf8OzG5lSFZ8Fuz2bW70ZsNNq+iIw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791735646; c=relaxed/simple;
	bh=QUiNdW6VFdxYMeVAMHDcIzKBwB4DCuWygXNIK8VM5JY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d6/i9lWiyMoque6UzCDX0Albay/ebAgrQ6gG3dMZQApTx7jqU6TIacHKskQ8ocYEGNxJqr2NrUceO3vnd77upa3y+n4igcNh4KaAyRf/oYnhlPz/7RXaMGVCcGKe2WYDOITpBW6QPwEiVfyTOhwf19zDRF9m9roxShJGaIG0QgU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QG2kYRMS; arc=pass smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QG2kYRMS"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-34c522572bfso130528eec.3
        for <rust-for-linux@vger.kernel.org>; Sun, 11 Oct 2026 09:20:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791735645; cv=none;
        d=google.com; s=arc-20260327;
        b=kZ2YbVPJZn+q8uguME655XR5O9+TraA9mjWCfMjmti8wlrJLXdcStVDSs+9hPyGziQ
         DnhvZsDfMbbINNppD0hbuXV0kvGbFDTKIpLoE6NzA77S8Ta66/0g5s7c+31QirZTuZgN
         pgYOOnTyfRaYdTOr4+Ln0biGo8QE2IrPxdbcIbuHQ/9ycRsBYfUCPwRKbaF/P5PMBgEE
         NWkleZiKkw+vE0hz+Ml9lCYrpNwmJ/DWPQX9aoR5XtsDxzdO9+s8sWaqW+NCQnMT9xtQ
         FPxHXY6abWILUrTOwzQk/4fId89fxJxB0rTNc5wQCFUPVJVI0eTNbESPAz4W28Bk9PK0
         AUug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Pzp6+YC7TXvsEpHQZBAKMbTQLxmMNWdshnXk9liYwgM=;
        fh=wXYnYHh5EOuyilRbBj/D2l2gOb2omlS3Z+rssZeuSDU=;
        b=Aoh+KGVLVBY19xE7nONTP0kpz1CbgMvrjMthWMdd89SIOi1nc5PQQ7o5WP9SetfkEl
         UN96TpzjGsW7Jtu42wBNA5Cx3xjJ6tO3UQMme1kpkKN86svVsN5+0lCDpovDXu1nC3qh
         RCR+tM/5YvRljtpRVDdOCX0KMhTWNg10arjQENPaq2PF2K3c/VdyW5viHOq6d3zutvuW
         amNW/rk8NOvOtG9h+0kbm7e7FkID6eRpePCIVOM/Nzt7g76/K/f2J4H19s8x3QnkYSUp
         B0zpm0hcv0t8WnT5AqYQFvlDVe32vXqnDHbqLnlx8DBbgnCszLB4UzdJ1jkqhx/I+KWz
         0Qhg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791735645; x=1792340445; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Pzp6+YC7TXvsEpHQZBAKMbTQLxmMNWdshnXk9liYwgM=;
        b=QG2kYRMS4i3OrV5onbdj0jIQ20na/j6Qt9IiEoEby1sFgEnD2dpq/Z+amNR3LqlipD
         uAuxNIYHEQJDS0LE2J9ufc6Bm5F/fHUgMCalizWPwfKBDtCO2pix7DLxGXT+B1K8gAB0
         XguEpKW7LydITFy+Gl1/Rhsw+xwlCEF7C7dvrzDc5aRvxH11L0XJUOJ/9uGpndmyvmHM
         gCzI+D3QKPYzlQ03C3fIhwV5s4nFh0EYLDYQy8aTl1qJtOBuOMNvOBfp9jHP/GKdmKyV
         H3OGVf5fS88hl+tBZC58suSWgN5tKmdzLZcoBK9Wsry0JMrmmEPYHfP9rE3t9GMeHQTD
         qBbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791735645; x=1792340445;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pzp6+YC7TXvsEpHQZBAKMbTQLxmMNWdshnXk9liYwgM=;
        b=i9pTTTQbjFUDwV6ZMh6EfFZJtTfK2b2D7tLpSPVxW3QLW/O59NioBRbWJ4gaUj+whC
         CWw4SRVK6or8JuWrhtptUpdRkub1gcXCNSIl0mOOj6GuYMBN0wwhr+o90Hpt4lnFvrbU
         oD/c4YHoCuxi7jRir4EOIxVOvFewiQhQwjONve5ac3dk8vgGmocDaAQRBqfwZC4QM3uY
         b6P4VguMysXdnW1amxxEKbFk60whQStnZXrAwPfK08uA7CCHTcZbfW6e4HkpvD5O/b1f
         X40rgtEa1VJa2UhqPurMqsdgkZZeGLdrVveE00g8FWTHCtnYPr8goqLXfJnfyuD9zR/S
         1WmA==
X-Forwarded-Encrypted: i=1; AKwUvBymUa14rTSt8Lqlf62bvkBL3MpBmKzVMB71hvWEL12AsKFwNjocGWVUxIwt8MwdMIC6led2PVTrqrQnFX+I9Q==@vger.kernel.org
X-Gm-Message-State: AFq9FYK0AkvkwxfpfP/IwnkCMDPBsX427zFdSS/gM2YM/nE11lnnC4pV
	mpUeAlrvHelEtiAJiuiixf72cGglBT7eQDLiqusMEeKGvy6aD/BNXk1FvFirmm6oTRfcqRyo+bP
	ItZ146xpG+jYHeAES0BNCEzezeKXY1xQ=
X-Gm-Gg: AYBFou29tVNiYG40GQI8uKAgmSe4feUh/TcJw+qmfBucvHoD4eLXmGadkd6lZ02ZXID
	yyR/83SgjmCHOFt8Mo51s842zUS3GiybZRylQlBJfmcG/4pSl2q5jCivKRu3xdBvD77NTXZMvZ7
	Ue0v7s+gCDc0U+KiUdI7DAxHEBBYku5Oxm/FqgAucKiKIgzC+aVXk3Q390TXb3IiyEw/99ghA6b
	sa91XfYu54quNiGNtzVDBFvPlN0/ttm5Hgf1dtZpfv3rGvmVuLooJO/mOrSEgosktlU99h1W2F5
	JyWp0GDvKFP+RmWwwtSpdK19fh+OL35Wb62fE+SpEXNiDcqN7LgUsKRqjGeDHGehU/3TT4UFVFA
	q+CSATHf3JNhKQMFgwMZ3BJ9srmUzb15K+9cbGj13npRaO1HMVXq76FXxqrzzxMU8YroSpCH7MH
	aWrAOXixhYcbUHzUqowcjpQu3+le59PMmOv7jAzjOpjJtb9g3elwU=
X-Received: by 2002:a05:7301:5413:b0:358:c9f3:b055 with SMTP id
 5a478bee46e88-358c9f3b260mr9244966eec.1.1791735644658; Sun, 11 Oct 2026
 09:20:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261010095001.265759-1-julianbraha@gmail.com>
In-Reply-To: <20261010095001.265759-1-julianbraha@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 11 Oct 2026 18:20:29 +0200
X-Gm-Features: AclHuK_w3Y4kAwcZA7SbeHM9fSvSzVE9w0UyxZwltGRDETa14I43fFQK9NA9AuI
Message-ID: <CANiq72kyZpDa1YfLjPYQbatogvMONM0SOww1iQDQaZ4atcu+9g@mail.gmail.com>
Subject: Re: [PATCH] kconfig: wrap long expressions in menuconfig
To: Julian Braha <julianbraha@gmail.com>
Cc: nathan@kernel.org, nsc@kernel.org, ojeda@kernel.org, a.hindborg@kernel.org, 
	nico@fluxnic.net, rdunlap@infradead.org, grahamr@qti.qualcomm.com, 
	jakub.git@horky.net, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 10, 2026 at 11:50=E2=80=AFAM Julian Braha <julianbraha@gmail.co=
m> wrote:
>
> In an offline conversation, Miguel Ojeda reported that scrolling
> horizontally in menuconfig's search to read RUST's dependencies has been
> slowing down debugging.

Thanks for working on this!

This is definitely useful, because users (and ourselves) have had to
scroll horizontally too much for `CONFIG_RUST` :)

Maybe it could help to clarify here that "debugging" above means
understanding by users (i.e. not developers) why the dependencies are
not satisfied. `menuconfig`'s search is uniquely useful because it
shows the expressions with the current values; i.e. this is useful for
most users dealing with long configs like `RUST`'s.

Is this patch the live one you showed me back in the conference?

By the way, for context and future reference before I forget, I
suggested a few other bits:

  - Wrapping on the top-level `&&` operators.

  - Even better, wrapping on the actual `depends on` lines, rather
than every top-level `&&`, because sometimes they are logically
grouped, even if they may use themselves `&&` for the condition. But
IIRC we discussed that this would require tracking more state and/or
reworking part of the parser.

  - For completeness, I also mentioned potentially considering to show
(a subset of) attached comments, but that is not really needed and it
is really low hanging fruit that is most likely not worth its
complexity: we already have descriptions and most options are not as
complex as `RUST`'s.

Cheers,
Miguel
