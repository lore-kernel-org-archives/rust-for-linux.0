Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4753D3939AF
	for <rust-for-linux@vger.kernel.org>; Thu, 11 Jun 2026 22:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781216818; cv=pass; b=WMbAQvB6t5x1/yOc9PbbidtTbk5HKBiC0F3ZGR5WW8BYaFRGgRlzg9D9mlb3XzAUB9lBOF6ETGjQsT/X2uVeUStctlN/w7YH9GqEtopS1Z9ga+qSwN/hYBx87S9hLGG6oxkTPYDbS+5k6DsfESrWHNlLbXCfz3hXdwVsUkzSFSA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781216818; c=relaxed/simple;
	bh=68rUWUAdGxpNjbkIhUuI3gw+TVNJHtNh9q0jDUnQv/U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j3h680XfqY/J8W9vtsUJUeeWHnvCOD9cErobwVN3slzsHoUd+Cp4v2z/WZQ/uBK7hqEziF+jdvOPPmNx09CD9Jo/bDewV3rG+v6MWyO71YZCC4Ift7TlD+hGXdENIbgfnIqiN+hQMXxig/q7f3nzRTanZv9a9fK3wiwMQQgTD6M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=akomxgcv; arc=pass smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="akomxgcv"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-490b3637b90so2083545e9.3
        for <rust-for-linux@vger.kernel.org>; Thu, 11 Jun 2026 15:26:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781216812; cv=none;
        d=google.com; s=arc-20240605;
        b=YAaTd4pctsFyKPbZV2zygDiGT8q5gLNb+xdjkTB3vmc2hzKZwICI5QGElIx6WTQA03
         e1iGPPv2WFceyh6MdN5cZz+wY14OB5/n4LF8n3q18a46YurvV33r56JHLcOkX9OiGDgA
         gNoaEFAtv7XriDLcWpIh1Gc1FOhbwKqTeZigcytGw4fGP/a4YW/kBGkXPdLvFn1NDfeR
         o5gYGVGyy16XpGXHVVm9ckcxt2kQ8yeJyZzILppmdd/Zatists4JIueB2FxOi0bBLErm
         BzuIOxnOTdHgvkpm0AwEcFPT6zwOmT/HLJTFexpxBiAOrPqfbbOuGvBEZgxCkYEQC0qL
         J5PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bUG5E+qMTSmk9Ixe5qRHn6pqSYcBNooBA+jeoM9km+E=;
        fh=VMkH7CkdZPHcGjAOQvAd9F1GT5sKwDL3b6InKbZWCEU=;
        b=I8mRKMi+6eA/hnYsPo8cbHXkY0d+8H9LqCJpHQW4VHh6ux7Sff76NK6LDMg5NBu3Zc
         7hWRUYLLmWGq/dW79j1PYFLa2YTbkwu5y8N9LYC7BuhoCKrUoe98opxVIE2n4yrsYBgk
         +umvJtz4l1s7dxVoakmLdRXnxLxs8ly0pPDnSn5kvJL+H9pmmgIX9jEeyev1sVFSEi/i
         iRdIEcfEOl6m7dWak8TcrVOMsALaOowFdn7nMuxDLB+cB9iQtBCUUMAZg9XZTHT7hSqG
         oUkaZMf234exP6KSa9uFnHP1qq1wl9+zq7dWVSSCuRjKbdv3zvuYJClCnEzTc5TmDlCS
         5cXA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781216812; x=1781821612; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bUG5E+qMTSmk9Ixe5qRHn6pqSYcBNooBA+jeoM9km+E=;
        b=akomxgcvi2LdX6G86ODQ10im+YC5CZiQuLJUYdSMNPNdSgyJTD7jbAK22hmwxqsxst
         CcxZk3JPGzY5RTvj/b9knxo0p3YtBja5ywDYRvrtE0pnb5iai/d/OqsvOWLW5fPXcfeP
         UJ3V0hT9WlJl1qitW3UeT7CpRZT6TMeOJBMRtjzqoN7LgGWpmtXKugAnTWRVAC2QBQsk
         U6riRzQX8z6Yvg4MqlYATqifkbnGqF+PueZkQi9WCeWYHLQLgA3D74Xd62a3T9VyAVNg
         arStExtJYdA8xGgN2U+FJNFDlt99nQ0lRF2LcpNvWQoDO5b5UZDE4OkAvGM10iq2IrbE
         vp8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781216812; x=1781821612;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bUG5E+qMTSmk9Ixe5qRHn6pqSYcBNooBA+jeoM9km+E=;
        b=bcSfZNsZwe88iDRSOTRCrDlQePMVaio8P4CY6/bgzTO7WUvOMTtX0iUgXoFrn5mQyg
         1OvqeUt8H0CWEZUrZjoScDYZRCoDlSSunA3WcfTaqr8Zz71NzV4nyfccKXFvDhHXik/n
         AIAtui3t23rgx+uh42nc94XYE+eP8Rsjt3VFutqf6Xbf13sVvozRY5egM5ByJauzbGOx
         2Jp5Ziu+jsIXlAyWLgmnBOmqUIdtUafZjb/sByu3ep8I2wR+QR0TSIWVx6v3U+dYdnCx
         3f9fCZ8hzRj+XvHaj/tEIxRyDFCipXWSGHaju8LdJv0UJ5zd33ABRlX+ksu9oVm9Dy50
         2JUw==
X-Forwarded-Encrypted: i=1; AFNElJ++9Mluqf6iJNcxz08yKL1ks/WKXTwaqGqNRfnk2jCPpzrTpnobYPEfhwOHd7LOWAw8kKJFivlk/g449y72TQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywxp3Kb2JsMTGt3JO9KQp7hyWPXh9kbsZZ999srZu+CY8epw5J8
	32EIfSxQPPHXW4PnUjCH8QIQz87QAASFJEdrWYaRQZI1KTnb2Agb2QMvkaOpf4NkfTlP7ul1So1
	D4sZXmUMdY0FJvM9DLWxcF5Er/DPp5m8=
X-Gm-Gg: Acq92OE3agcOC3MtdBsk6erC3L7A8fkK+1BkGQe3Uku4NttpyMddVBZ/cyHXuD+9ao/
	bJwnxPNDz3yUGa88Wc3HbIqUVt77qOLL/7ZrTnCFbnjqQTrMVOCuTXcLkNohW5baIZaIEKaNxj5
	Msl3aPjOosuZSYSf7go0e8AtEVQLdNJQsX3ZRW1SOKdBGEtbb0sZ87RsRsUjnT+tVGZx3awnf7I
	ma5DHXFFxanyRDYv2ZYSj+/hUQyg/h5sPwao84BIVwAQRW7OvRKPPytvO7REtdDSUQbgTAVjF62
	aqKDhw==
X-Received: by 2002:a05:600c:3511:b0:490:6237:521d with SMTP id
 5b1f17b1804b1-490e55d38famr65774985e9.13.1781216811617; Thu, 11 Jun 2026
 15:26:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260610035544.3333022-1-georgeandrout13@gmail.com>
 <20260610133241.374115-1-georgeandrout13@gmail.com> <aipm9QeAyhah1Vkh@google.com>
In-Reply-To: <aipm9QeAyhah1Vkh@google.com>
From: George Androutsopoulos <georgeandrout13@gmail.com>
Date: Thu, 11 Jun 2026 18:26:40 -0400
X-Gm-Features: AVVi8CeV-obS9QgeTzwxBGirzv_qaUHVCHVrBJxhaWiVnp5fi4Gpl4tqEUs6g0U
Message-ID: <CAESH5ocW9Ks82fu=Unm1EWR-_=CfqUj5FGRiROeQe8zuU5oM9w@mail.gmail.com>
Subject: Re: [PATCH v2] rust_binder: add ownership assertion to Node::add_death
To: Alice Ryhl <aliceryhl@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>, 
	=?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Paul Moore <paul@paul-moore.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 11, 2026 at 3:42=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> w=
rote:
> If this assertion fails we should not continue. Either use a full panic,
> or do a warn_on! and return without adding it.

Thank you for the feedback. Would you prefer we go back to the original pat=
ch
suggestion with the assert!() that contains the message, without pr_warn()?

        assert!(
            core::ptr::eq(self, &**death.node),
            "attempt to add NodeDeath to the wrong death list"
        );

Best,
Georgios
