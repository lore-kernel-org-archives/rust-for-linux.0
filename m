Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D245441B36A;
	Tue, 31 Mar 2026 15:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774972162; cv=none; b=dlH1j1S9KXlGJOuG4DhrWHCskkX1/6IMc+nRoZmz3ATVPf4fo91vsfRlMFt96eAyCNbvagQDfHdxELFuuGFDV8ee47j6eHS80FrIyD0CYBw5Zpw4Cz+rsG+R9Cfuy7Uhx/bTvnEaBX3bPsZAHrEmY+JIcTsyxgctVIVdqXHa6ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774972162; c=relaxed/simple;
	bh=7kCkL53I5HfaBl0ME5+yGLcdQLcCeHzn6AGOxA6RaB8=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=XLdxXAEwBcFYgVyWbA9SX2zicKmkVQcu5voHQ1MGH+CYF0Mk8u1GrOYFhpioWNjLYcYmRYHmtt2xqYCFE0oo2K0yujhhu1J7X94Vebi4iPAed/9nVJO0+cDgsBaCJSdhA7Z1fn7JuFUcFW2vzb0OULKu2AoiMJFv+pjDN7vjrek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=epMPKIiY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="epMPKIiY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 699D6C19423;
	Tue, 31 Mar 2026 15:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774972161;
	bh=7kCkL53I5HfaBl0ME5+yGLcdQLcCeHzn6AGOxA6RaB8=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=epMPKIiYWMDh6Brs28DsAaAFAggdKSir9qlkbVcjrjdRMz8o68KY8pK3HxyXPQErp
	 GB9qpMDXaho6aM+IxmNBOHBwlcseF6OvgrvJBY2jOVs5pMx02P1bkVbuSCsVyejc/a
	 7p3EVa6dCn3WSmGeu37SAYS4kWrhyuIv1Y+iEgsAH+bUfh5iiw8zHGskQC9NS8Hz8E
	 4tzfDryHbUJJXcPGlhDVtgMY8Ree/BIUF4b0EFggDqpAtkWO9Qxs4cy2084ftY9RX2
	 N1EuMybJ15IqBkXTT/Jsbr1+MCFX4ZOk2tFB7GPZqPGypb1Ke9l8OuRhYPJlcLQI7L
	 Sd/6WjJAwGHDA==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] rust: replace `build_assert!` with `const_assert!`
From: Tamir Duberstein <tamird@kernel.org>
To: Mohamad Alsadhan <mo@sdhn.cc>
Cc: ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
 bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
 aliceryhl@google.com, tmgross@umich.edu, dakr@kernel.org, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260330020234.16893-1-mo@sdhn.cc>
References: <20260330020234.16893-1-mo@sdhn.cc>
Date: Tue, 31 Mar 2026 11:49:16 -0400
Message-Id: <177497215686.47090.6166585438988338782.b4-review@b4>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=566; i=tamird@kernel.org;
 h=from:subject:message-id; bh=7kCkL53I5HfaBl0ME5+yGLcdQLcCeHzn6AGOxA6RaB8=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDJmn3zJwFWhz/6wsvX9I7+HR1cd6zAp5d3dW5xhGTZaoj
 /9SpFXbMZGFQYyLwVJMkSVR9NDe9NTbe2Qz3x2HmcPKBDJEWqSBAQhYGPhyE/NKjXSM9Ey1DfUM
 jXQMdIwZuDgFYKofnWX4zbqT/cLJJ++/Pt82/U2qf+zbE6sypO32R09pO/jZ5tqnWwYM/0wduxN
 ufSuqMA7pePHjSe1898xGux37tyifkkhv0ymZxQAA
X-Developer-Key: i=tamird@kernel.org; a=openpgp;
 fpr=5A6714204D41EC844C50273C19D6FF6092365380

> Several Rust assertions currently use the `build_assert!` macro
> despite their conditions only depending on type parameters or const
> generics, not runtime values.
> 
> Replace these with the more appropriate `const_assert!` macro which
> should trigger earlier in the compilation pipeline. This is possible
> since commit 560a7a9b9 ("rust: add `const_assert!` macro").
> 
> No functional change intended.
> 
> Signed-off-by: Mohamad Alsadhan <mo@sdhn.cc>

Acked-by: Tamir Duberstein <tamird@kernel.org>

-- 
Tamir Duberstein <tamird@kernel.org>
