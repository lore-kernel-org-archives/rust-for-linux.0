Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58093486438
	for <rust-for-linux@vger.kernel.org>; Mon, 12 Oct 2026 12:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791807743; cv=pass; b=A9A6r/OTmlfsFyLuNJ17U+7vsdNIVtcFX1Rr14VjiicIKx35r2KuOeITMqWNlXYWXLWBa336VGW+CKUWVaKDlhusNgg7GAmDkfoKa/VnpjVg+H4Y1o4LoE3KNrUU6aFw/3oHO+5OnHztAvPCrHfOF5i+NjLEJOeVkVBdipZVYQY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791807743; c=relaxed/simple;
	bh=W0/B6G2xceZ/TEBz6rYStoJyGubm7Za/8bijy2O6/uQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dlepOFXKZbw+QqHQro5CwXgwDmHXNxP3fIc6hBRZ5KJtkIhK5rumhsaKKm4uetQntwdsv/J3XP099kRaz4RYDiRGzlB1VQe8uCwgdONupfh+Wp7WxRJ3M38PUg9MgbGz54KuBXXSuQeDC4aJuCGy8PwSkigbdRhMCZZ9T9nxnpk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ixe4Q0Xt; arc=pass smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ixe4Q0Xt"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-33c30fcf33fso239757eec.1
        for <rust-for-linux@vger.kernel.org>; Mon, 12 Oct 2026 05:22:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791807740; cv=none;
        d=google.com; s=arc-20260327;
        b=oZSD3ybOW4AGEO9dsOEicDsjBzoQFlKHFuDpSm3/FupjWnYutEgUlfxt3vwDqKemgB
         IGOjSengFhqN0taGLgNtTrj4pBwrF45+yXMweImruyFamF3go4CF3K+sWs8Bkkc5qTuQ
         708MG5z4R9HkTZZccCLVf2etRQ3Y5Yu7W5Uv+njnr0d1OgbE9Lb3bOpyMxLYkT97os5c
         9zq9GhKY3L+F2KmajwqA9acuzq1vP7X+hXOzJecJzHYnvUdjJJG8h+Pkz/UpJ0x4R8FN
         ngObvaGBFZ2daSYjjtXpVkQ7vKgHuMjYdZivOXUQRd43eRoj4uZSAKbqCKJ/n22qSsCX
         sO+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=W0/B6G2xceZ/TEBz6rYStoJyGubm7Za/8bijy2O6/uQ=;
        fh=OZ1fn3Xq/jcfvW1ZUV0TOybebwcBsNE54PcR9Qv/nzw=;
        b=p6EzljEbNw2qXHantS8sEFXBnRzkM6xYflIMFZQOLWZOMthNIl3GUVnAcMT6aoZuw7
         0F6nXsOMxfSLz+3l62YekT4iJrtEMeYgfHHwhS5BUM98x7RMDjRclm6RDsa2vsYmTIyj
         NyyGHcH+QxtyE/piyU0Fjp/INivxfcnLn5xE47sEjYGk2R/xPfCeQ4k8GZzTodLZB5Td
         iA9Vp6JAW9Xs+GNTeClzEobg7iDUBDZ6fGyC9G65yXtDZpU/RZJJTPBRSk/2ZOujih/C
         VNadXMPC5ZaTX1Pcmlfep+S5zdWMzliyHGojOPka4zIEUnyR/ZMzNb5EbdS8A+ippEup
         utxg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791807740; x=1792412540; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=W0/B6G2xceZ/TEBz6rYStoJyGubm7Za/8bijy2O6/uQ=;
        b=Ixe4Q0XteuS/ZDj6nzR105B59owKRYEi9tU1pIPBR4fZaqn9sFJGpvnit+2GRZmJ2w
         h6jKEF+5VV3wI9H39XIXycHCOweGWgRlfEtoJIZi8wOKJHJapj46A2EiWTInogeK8LWt
         AUbFnRH/O+TdKU0sMkuoSavXFT/RWHi9cIIjfumQBzxF7xi85K3DLukaQKTwUpb9Q/2A
         jFRrkbiyasDRrxLpdQxsMkFmo2FB5h97zW5e0CCpxxT+b4A2RevLd7SDjh6JrDb7JjUA
         z0ViJFnL+PgetMb9JHeDma/6On2a81vYbBn9NirLWI58nw99oaam6Mjg3ocBP2ujscSx
         0QVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791807740; x=1792412540;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W0/B6G2xceZ/TEBz6rYStoJyGubm7Za/8bijy2O6/uQ=;
        b=G7oInIMT7gqW81kVovnL76S+bG7zQ5FqbFrbICVB+WPTaKaKUdfX8sug1+2fqAfX7h
         sNWIAC0fMsmPaqigLWak8dt2Y+/oIfxQUz3JmnyaVXRb4fP7wLGQ8qT+8NNNxoCARdo/
         izYRp/PkD1MXWCQrL0N0E2tvRWw51p5jq6Bj4ppEHlnRL6fgBsGUidj1zbZ4iUrtLk5g
         7UHl9hl9ref7Hh3D6WpMy9Rm+EN9teQ8sevHiWS5fV/v7wwyYUQNSR+sgph4JY1VOA7w
         WU61E7wAL1prfdAzzm+qg7rOypMvjGi0ap/TOJAmHbEP1LGnhRUdYJXhsNjYcrvdxtro
         /HNQ==
X-Forwarded-Encrypted: i=1; AKwUvBxwSBfYD00+hrJVaM+XWHuA4sK+vL6QV7C/OJj0i0eiAm/HEkd6IgukQ0/YWKshIIQpD5GJYPIkGdfllVLuTg==@vger.kernel.org
X-Gm-Message-State: AFq9FYKoDS+zM3F9kR/iw50dFgeJ/nSr/uJvucJEF2+THszxKTgzwsk8
	6hvjWd1QMCJKaBIMmt97Ctwx8cRxgcou2o4zdvxxRxFYhSAwNCVO05in4EbNtJVmC4deDO8tZyr
	inoVtRypRQ3DlCgyv2fKnnFBCo3HeFSx/n7tTxeo=
X-Gm-Gg: AYBFou04PWbQOs/ofLipZ7I9iJWrhM/EWx2Mvo+ekP8861yn5VaJv1igJn+yuIhVCmM
	GIhoc4sNrB0Y5TqE6wdbAUHrx0PEdKAY+SRPP0Arw79/UuBt//004tbJWcQ2jqgmtsPUkh6vuV8
	zbh//XTB1TADN7EkQtOtoEt+94MYjtJJD1nDCE8MKOjIybZMmhqCm6m1vHxzS1dkfGK1W18uq4w
	kzoB69kg82exrhJ93e33eTTn2zDp9yMuPVMgAEVztMWcXVtQfcpg7atdYWyfIy5ZG8QSAS/FNty
	D/mPyfw8tKUC9dnUz9fW5z10yKgba68usf/9LBjLZuKJZzSxcQzYHhUF/Lz49It+k3HtLOWe902
	H9rVVky5utULaO8XOqO4UL4+FrRHp1sN34ZM5kZDZr0F2ssSvNKgv2v6Gy2T6XojCaiprirBU+K
	DelNBsdLGm/d4macl9p9AVpdw8uNYoEFKUSbS+5jgOhVoS7i5zlGs=
X-Received: by 2002:a05:693c:8810:20b0:35b:cb5b:c71e with SMTP id
 5a478bee46e88-35bcb6b1c6cmr666843eec.1.1791807740051; Mon, 12 Oct 2026
 05:22:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012-nonempty-slice-v1-0-37d1fecff82c@proton.me> <20261012-nonempty-slice-v1-2-37d1fecff82c@proton.me>
In-Reply-To: <20261012-nonempty-slice-v1-2-37d1fecff82c@proton.me>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 12 Oct 2026 14:22:06 +0200
X-Gm-Features: AclHuK_JfArOQC24q8bhqpYHyF8WB4LrV3JCNgqOFmRVvHpNftv_1MS-eocclDw
Message-ID: <CANiq72niDTiewxWGC=PTCoG1xeb6hVmeKT+5N8DDHV2bQdQ0Ug@mail.gmail.com>
Subject: Re: [PATCH 2/2] rust: uaccess: use NonEmpty in strcpy_into_buf()
To: Lorenzo Delgado <lnsdev@proton.me>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Thorsten Blum <blum@kernel.org>, Francis Laniel <laniel_francis@npnm.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 1:54=E2=80=AFPM Lorenzo Delgado <lnsdev@proton.me> =
wrote:
>
> Turn the buffer into a `NonEmpty<[u8]>` at the start instead. The

Hmm... I thought the idea was to request a `NonEmpty` in the signature.

Is it not possible for some reason?

Cheers,
Miguel
