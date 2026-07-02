Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 145D33C7DE1
	for <rust-for-linux@vger.kernel.org>; Thu,  2 Jul 2026 11:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782990541; cv=none; b=tNa1XUVbLYKJBqacCcu5atZJ5aVOh5Fb+J1rog94Lttc16PkXCcjEecBrw0U7LaNawxFJvthZeqk22Vmgx4J8VqD3CsMlvfl4dAafHZx7l4CEKeLA68LU8qlq+t8X5ES6nw6SAjgaK1cTEXZzuyqIoTHTzhr0J7EY1Ab9Vkm9v0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782990541; c=relaxed/simple;
	bh=jVCZGfbP7HC+WzTxesl+YUJReLdqruEqQo/d3g5mQHQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=tM7+OZhrzISaFgWFixyCFKPeWTpSmQSb1Owhi1QQJztBqBarxx/T61P1u4kV02TSPESW5BtPe7lpWi9hK51zKgtzQJvt+IxerPVbImn2G1h0N+bBKdi6pSTl3uzqCStnGNBw2WW8NubM+ala34YT9NTcuN81rymG0Z4P1WaKNqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=M7n+42nu; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="M7n+42nu"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-492488f8583so25430655e9.2
        for <rust-for-linux@vger.kernel.org>; Thu, 02 Jul 2026 04:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782990538; x=1783595338; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jVCZGfbP7HC+WzTxesl+YUJReLdqruEqQo/d3g5mQHQ=;
        b=M7n+42nufjcqGgktC9jcmp3PzN8GZt7jEneo4FTbT6aIPZl0IlaPVbLi07MQgN0iKi
         adKdUSi8ikNvcdh4CfV2WAmm+xuHym0khLBX6acatcrZZwVkOJ0qqpYnQx1Z1btfjbWh
         LUtknxCRN0e04m3pDSH60MZtNCKrq+WSLRpRHVO51IdUAJX1TU6bUIe6vJ9bGi9WBBEb
         qZ5ZMa3xtAl8D5M/NxRqWaV6E04iIByRLjb2ow0oEjHy23sayb9fyvVnAWH/Zv+r82rt
         00cfLmygXeN8t02DiUaVdrXJpJWpG8f4wiFyTYPplZgncUpiHPBQcpdLEqaz5U3ceNam
         JSew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782990538; x=1783595338;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jVCZGfbP7HC+WzTxesl+YUJReLdqruEqQo/d3g5mQHQ=;
        b=cMwK8WPDLbTdEexKutnejz6FCvVGA9oVIb/GXlMk4Yof0vKx1hE2Dsu0fFrVZgTvln
         +g5wp1hmGdGCyMBt1wVY/I8m4+UzIJP/Vnv244DJlUPJs6z2AK3XgxYiD6sK8osGSW6M
         +T0NDHK14oQpj5k86oGTaTmE1xGqUCUSF75932v0nLU13bb0+rHG1nf1wj+joid49Kxr
         DfrGdtZgnyeUuSmr7kGr2THK0iWkUryhvPDjnchrUepgylIduD6xhSFP49uAYLlz6Tf3
         OvrIGvnDx5MYEDMId8aGujQGyhMETXiige1oWtD/TBJUUqq7uFTBkE/Qgq4ifqMViMj2
         1IUQ==
X-Forwarded-Encrypted: i=1; AFNElJ8Qhcdk6n1I7O9kDZ44iCHddXAuaLJUXNsKiusw4xJFpb2KIGUivY78EwI+d+OngqOhLxB6mFtmWT1pCmaVLQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwTbafWZgn7RARL263zN6QJzlpoomaPjY/xE7ZZ0KGEg0fXlPAV
	7nQ4QLpsQ+Vcg/bV1piONhrtZ1ihTs9DG5CCwLI726u8rpP/5KCSA5xY0aCnHKJXnsNIGOK1p+r
	ettCe4og60PD8G96wWQ==
X-Received: from wmer11.prod.google.com ([2002:a05:600c:434b:b0:493:aecc:774a])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:34d4:b0:493:bd2f:c5fc with SMTP id 5b1f17b1804b1-493c2b3d569mr78696805e9.15.1782990538252;
 Thu, 02 Jul 2026 04:08:58 -0700 (PDT)
Date: Thu, 2 Jul 2026 11:08:56 +0000
In-Reply-To: <20260626214404.852685-1-nico.antinori.7@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260626214404.852685-1-nico.antinori.7@gmail.com>
Message-ID: <akZGyP9dGcQDcQUp@google.com>
Subject: Re: [PATCH] rust_binder: use pin_init::zeroed for file_operations initialization
From: Alice Ryhl <aliceryhl@google.com>
To: "=?utf-8?Q?Nicol=C3=A1s?= Antinori" <nico.antinori.7@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Arve =?utf-8?B?SGrDuG5uZXbDpWc=?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, 
	Christian Brauner <christian@brauner.io>, Carlos Llamas <cmllamas@google.com>, 
	Alexandre Courbot <acourbot@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Benno Lossin <lossin@kernel.org>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Boqun Feng <boqun@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Danilo Krummrich <dakr@kernel.org>, 
	Gary Guo <gary@garyguo.net>, "Onur =?utf-8?B?w5Z6a2Fu?=" <work@onurozkan.dev>, 
	Shuah Khan <skhan@linuxfoundation.org>, Tamir Duberstein <tamird@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 26, 2026 at 06:44:02PM -0300, Nicol=C3=A1s Antinori wrote:
> All types in `bindings` implement `Zeroable` if they can. This enables
> using `pin_init::zeroed()` for `file_operations` initialization instead
> of relying on `unsafe { core::mem::MaybeUninit::zeroed().assume_init() }`=
.
>=20
> This change improves readability and removes an unnecessary unsafe
> block.
>=20
> Link: https://github.com/Rust-for-Linux/linux/issues/1189
> Suggested-by: Benno Lossin <lossin@kernel.org>
> Signed-off-by: Nicol=C3=A1s Antinori <nico.antinori.7@gmail.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
