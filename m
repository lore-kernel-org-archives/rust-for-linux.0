Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4E9153E31
	for <rust-for-linux@vger.kernel.org>; Mon, 11 Mar 2024 17:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710178924; cv=none; b=ps9ZYVnJPIRujVSCQaf6xXCygU8UI5uw+yjSlJ/VLOO8neN8GAAmMfM7Ou2bpNt/WXXDqVZHErzJVaM4avAruJYT1vJ3f7lp7LsrQqK/XOSLGeRLti8W4vkYm8OIXBOHuijJUiTYVJpa7FZI1ldGeMJMaBr/R5UFxrjwqAHp1sU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710178924; c=relaxed/simple;
	bh=ORGdsl5UIR478ZEBG6URHeYsrx2/4RddGZKZpjoNWPk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZFV9QKsbGOl72lSZWA9O3JLk5ByB2VUiTbAmznqU+gqhK0J7jc0pA3vNNHD3Cp5n+i99yQGlMdmFluJ7smAaFQptpMbUDvroBMq0oH4+Vl9ngB51fE0FmP5PzvnoZncgwkASc3xyAU+THToE0jaZkq0lVwB3Kohm64NM3CcivOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=M19iv89K; arc=none smtp.client-ip=185.70.43.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="M19iv89K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1710178914; x=1710438114;
	bh=ORGdsl5UIR478ZEBG6URHeYsrx2/4RddGZKZpjoNWPk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=M19iv89KHOgi8WvCcBSJgQ+iQ6dwQZtOEBTFnyjbR/b2Q1uQ+qJWtHVdEJaWw+zC6
	 9G6/BZTq/6+yHuu28GUw+Lbjv75GA8+/v/q2GP8gg7NfLlqDL34DI3cjkpln1EcQor
	 ZJs2dkre3oC4lXNahHUHLLnN8cxw1kLkNMfvkhVod8jF9xHl1goJLxK/tOjaESgzui
	 Ux+1klC/q6um7mnvcCCGwf1fLWnsVNRxtUtdy9ZhM2T8xq8Gm3sLry7SO0ZaTFrcDq
	 0QPNcnc6Cz+OLW5SBx4QRfm9uHKLX7o2/PliDOPZelQPeIiixkGR7ATrH3cFzGdBSx
	 4mqZeGZojuDiA==
Date: Mon, 11 Mar 2024 17:41:32 +0000
To: Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@samsung.com>
From: Benno Lossin <benno.lossin@proton.me>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] rust: sync: add `Arc::into_unique_or_drop`
Message-ID: <dbbff5e8-81a4-4be2-84fd-c51b67fec190@proton.me>
In-Reply-To: <20240311-arc-for-list-v3-2-cba1883c62eb@google.com>
References: <20240311-arc-for-list-v3-0-cba1883c62eb@google.com> <20240311-arc-for-list-v3-2-cba1883c62eb@google.com>
Feedback-ID: 71780778:user:proton
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 3/11/24 17:08, Alice Ryhl wrote:
> Decrement the refcount of an `Arc`, but handle the case where it hits
> zero by taking ownership of the now-unique `Arc`, instead of destroying
> and deallocating it.
>=20
> This is a dependency of the linked list that Rust Binder uses. The
> linked list uses this method as part of its `ListArc` abstraction.
>=20
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Reviewed-by: Benno Lossin <benno.lossin@proton.me>

