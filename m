Received: from mail.w14.tutanota.de (mail.w14.tutanota.de [185.205.69.214])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56B391C1F3D
	for <rust-for-linux@vger.kernel.org>; Fri,  8 Nov 2024 20:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.205.69.214
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731096611; cv=none; b=owYQosnZ1uVx+xxzi+u4GOS3N6qZSuwK7AAtNgiCN4am9/VE/uLhIkV2+ccb4b7BnpGIZN1YJq59io/qWv5vl/hs1v2Rt3t8VlrLbT7lAtUVrLeu9NTtBOnci3vv61ANjv7C1Tw5rXAUDcWo5AX34YdiE2NZfh1cYNailSHaMQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731096611; c=relaxed/simple;
	bh=cKb1CsHA9nN6fwps/kwZgEmKuSFF0WYCgRsUswdJUzg=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=frbH0sza3z8yIKK4vUajacTCyVK+4tfXchjI1He1M6Jc2J1XieNiXQI0atDjFhpWhlG/sNZXdBMy8qufqQWCEYmP+UbL5tTdSzVpdcoo3gXchwM06dmRVnM4utk/M+ZAa1Nr41FQeIIFNyUZydQmjZED4CRYIUbyM4pKIbIZHFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuta.io; spf=pass smtp.mailfrom=tuta.io; dkim=pass (2048-bit key) header.d=tuta.io header.i=@tuta.io header.b=jS+8Z0EA; arc=none smtp.client-ip=185.205.69.214
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuta.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuta.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuta.io header.i=@tuta.io header.b="jS+8Z0EA"
Received: from tutadb.w10.tutanota.de (w10.api.tuta.com [IPv6:fd:ac::d:10])
	by mail.w14.tutanota.de (Postfix) with ESMTP id 80308374160E;
	Fri,  8 Nov 2024 21:10:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1731096601;
	s=s1; d=tuta.io;
	h=From:From:To:To:Subject:Subject:Content-Description:Content-ID:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Cc:Cc:Date:Date:In-Reply-To:In-Reply-To:MIME-Version:MIME-Version:Message-ID:Message-ID:Reply-To:References:References:Sender;
	bh=cKb1CsHA9nN6fwps/kwZgEmKuSFF0WYCgRsUswdJUzg=;
	b=jS+8Z0EA3s1iqun6bnRlbqqX+Y1S4HDoPFRgK7/b6ykYELcYd4+gxAwulPskysBk
	MbUMZmIs+SVMgOG3q8vOeVPkbdswAeVpafYiHfwLmVWIQN+T5sX6eRsRk1d5lmunoWY
	sTe+vCeGDi25Wevp2oWh08ywjkUJTeLXp8hMhuGEqjyqEXH9gUI3MYGP73YcvI7B1YZ
	Cf0DvZZpOwLzfJ0Ll00IVbc5Bq2ixjb+FxqYqBiqk0ITMKrRbwETAdUGhhC2qm4jE+W
	j+p5K3l2KxN2IaID7Aa3vBaTTWxE5ByrUEq/BBiwJZ2OBs58YNNTOPHTaLIWVDy59nw
	fA7ou0/aTA==
Date: Fri, 8 Nov 2024 21:10:01 +0100 (CET)
From: jens.korinth@tuta.io
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Rust For Linux <rust-for-linux@vger.kernel.org>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Dirk Behme <dirk.behme@gmail.com>
Message-ID: <OBCOT9J--B-9@tuta.io>
In-Reply-To: <CANiq72k_Mcf=i+0WP5_VBV+vsgWoRJccNNgtU=BtNvoJbO1+Ng@mail.gmail.com>
References: <20241107-pr_once_macros-v2-0-dc0317ff301e@tuta.io> <20241107-pr_once_macros-v2-2-dc0317ff301e@tuta.io> <CANiq72k_Mcf=i+0WP5_VBV+vsgWoRJccNNgtU=BtNvoJbO1+Ng@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] rust: print: Add pr_*_once macros
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

> When sending a patch from someone else, then you need to sign the
> commit too, i.e. after Tomonori's SoB:
>
> https://docs.kernel.org/process/submitting-patches.html#sign-your-work-the-developer-s-certificate-of-origin
>
Understood, will fix it (still practicing the whole flow).

> I think you added examples (which is great!), i.e. you modified
> Tomonori's patch/code/message -- did Tomonori agree on the changes? If
> you did agree in private, please ignore this.
>
We did not, but luckily he already replied and is fine with it. I was unsure about how to do this - general question: Should each commit in a patch series only contain the "final" code for the topic? Or should the series also reflect the development history (other than via the changelog and acknowledgements)?

E.g., in this case: Was it correct to modify Tomonori's commit, or should I rather have added a separate commit that changes the code added by his commit?

> Nit: missing newline between the header and the example (also other
> instances below).
>
Ah, right, will fix that, too.

Thanks a lot for your kind help!
Jens
