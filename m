Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D05C83DCD87;
	Wed,  8 Jul 2026 06:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783493082; cv=none; b=ukGbCmBXpWfz8HFSOoGHiyLW/ltY8oca8TIjXOVr5zBM4U+YPQw286k9C10fWQ1r3aqFJMppUwz6XO3cx/xZHIcZ9j7EaI9jhfv7qVXLBmYO9GmRjJIEG5lHD3XG+aSAVQJZNNNZB9K/TrHyATXoLw4vYs4miR8sMS+0LXrsYsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783493082; c=relaxed/simple;
	bh=DyutUcvYzTdBFhcWbKVQmVL2u0/rT5U39dHr6E/V55M=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=chDlAZk1QWnyylwgOrBUNSGWkQQ469tiYwcHlLOfwQ2RYtivHKTpYSJIvnIN+/xbU/vDe56OtFqSRhWQlSPMN4lbyzA9T+GXwjUwEUl1fJce0GrB8o6YF1ZJdtIkmuQC3EFdSskXnHmAn0GvtHln7bschs45RvG9OinJHIIBPcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NUaIZ7Nh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NUaIZ7Nh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEDC71F000E9;
	Wed,  8 Jul 2026 06:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783493079;
	bh=EOBHy7Ajz+jhIJEoEwi5NsuxZkusVqYWXliwEbfrErE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=NUaIZ7NhZ+/LLI6oXytT77UvvwX/EuT4TgYOPw5xwuYVP2Wy3ekFMAmg4MsAXMti2
	 a3a0o+erdj1plsnSpXpH3vn2CzJkRpQzueruvDqGaE/zmswTONZnFvBHDsmi6veHLo
	 PyeelnHu/QyzIVAdonJINQV5Q0br5acDxSPxCHZFlTlb6XChtTShF/cN7bTIMIHl17
	 qCCWwCKFyNSvN0JXjZ/Esr+gHAZbJ6jlHmjkY6/HjdcCkJ0mIg/JthA295hhGiy+aB
	 zgFMC7Mk1VUadD3o0PVvXSVQMCRSAcJEzZokE8FJF5dCvJ3KqIntgddJguk+MIuNNN
	 2BxRhObKgQWTg==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Yilin Chen <1479826151@qq.com>, Breno Leitao <leitao@debian.org>,
 rust-for-linux@vger.kernel.org
Cc: Miguel Ojeda <ojeda@kernel.org>, linux-kernel@vger.kernel.org, Yilin
 Chen <1479826151@qq.com>
Subject: Re: [PATCH] rust: configfs: fix release safety documentation
In-Reply-To: <tencent_928148924004787BD355EAB1EA3348E30106@qq.com>
References: <MYhFFRyD6omXiyidE9Yx2_JbeF2ia3Y4dj4f4JkGdpRLNV6QDhXo0fqvH2pGd2L47vNQBemdYDSWrjCxJDBJxA==@protonmail.internalid>
 <tencent_928148924004787BD355EAB1EA3348E30106@qq.com>
Date: Wed, 08 Jul 2026 08:44:29 +0200
Message-ID: <87se5ugeuq.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Yilin Chen" <1479826151@qq.com> writes:

> The old Safety docs of ItemOperationsVTable<Group<Data>, Data>::release()
> described this as a config_group pointer embedded in Group<Parent>.
>
> But the inner code implies the implementation first gets the containing
> config_group pointer through the cg_item field. It then gets Group<Data>
> pointer from that group pointer.
>
> The new Safety docs fix this by describing the actual pointer chain and
> concrete Group<Data> type, not Group<Parent>.
>
> Assisted-by: Codex:GPT-5
> Signed-off-by: Yilin Chen <1479826151@qq.com>
> ---
>  rust/kernel/configfs.rs | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/rust/kernel/configfs.rs b/rust/kernel/configfs.rs
> index 2339c6467..2ac75c628 100644
> --- a/rust/kernel/configfs.rs
> +++ b/rust/kernel/configfs.rs
> @@ -437,8 +437,10 @@ impl<Data> ItemOperationsVTable<Group<Data>, Data>
>  {
>      /// # Safety
>      ///
> -    /// `this` must be a pointer to a `bindings::config_group` embedded in a
> -    /// `Group<Parent>`.
> +    /// `this` must be a valid pointer to the `bindings::config_item` embedded in
> +    /// the `cg_item` field of a `bindings::config_group`.
> +    ///
> +    /// That `bindings::config_group` must be embedded in a `Group<Data>`.
>      ///
>      /// This function will destroy the pointee of `this`. The pointee of `this`
>      /// must not be accessed after the function returns.

I think it should also be `Group<Data>` instead of `Group<Parent>`.

How about:

  `this` must be a pointer to the `cg_item` field of a
  `bindings::config_group` embedded in a valid `Group<Data>`.


Best regards,
Andreas Hindborg



