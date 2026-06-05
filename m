Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 294543B71A3;
	Fri,  5 Jun 2026 12:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780661392; cv=none; b=g2by8CejU0CiAp+e3BSBg8DUlbypwU/NnaaDdDqESHw//RDhcJTu3vWRjgKl+ZGlclkycMaZXLxaL9qsBEGK0HYej3fT3z6bggY5F/AcberdbopmeDNq/UdRUTpBACekyMJavXAfYGUM+ExVudvav9J9iMfsnpur1Vzpa2JsOfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780661392; c=relaxed/simple;
	bh=VgCZscMjQ1647+clqcTNC27NJ0wWuKecvNTq6Bi+QPw=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=hA4heaPbvb6cs6xncedI7HIXYJIUORvU+RUmepPCKMMTgTZj7EERaWEn1v8pJVsGDl2PAdShRD67N2zWKqk+2cOKKwRfWP2lFGjvoC0g/wi9j6O9AphvLr69/Mq+hQPh8Rbf8Pq284FKFQhchlNjMNFw5EsWqP6Vsb287hPmofE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nLnhTu6z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nLnhTu6z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81ED21F00898;
	Fri,  5 Jun 2026 12:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780661390;
	bh=P6pm0ngNlTwgN0rdGGNwGMItv+ds4bbUgbBYUDxDzwM=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=nLnhTu6zpTIcJIMxkiEZndo0BfllxNsSlYkKxSOXcOqCiQC3ET0pwZAcO7SRgDVOa
	 Ja3YaBgTeib2pDV27SFNAOXuqCT4B7ROGoC1DQW00qldZB1onVBI8s8PPvO3qjqA6f
	 wcao/Sz9uL1jT3lJ/npQreR3ph5t2YY8L8A8EvFpVym3C/6PD2mzu0l5j/e0ndmMyy
	 rb0l9zm8oxVVo62qfOej94u4mXcHtun7av+Cz7fsv+npOp6BGmQVwTkvSYPHH82o70
	 V/LuTMFxRM/ZJYaVaMs9q8IfwoAACR0/3asN0SgN6cXRJF7LjBcEtUXQ7lAcM9sayQ
	 IqsUeIsuCDr3A==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2] rust: xarray: fix false positive lockdep warnings
From: Tamir Duberstein <tamird@kernel.org>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Tamir Duberstein <tamird@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260605-xarray-lockdep-fix-v2-1-25a5509abee3@kernel.org>
References: <20260605-xarray-lockdep-fix-v2-1-25a5509abee3@kernel.org>
Date: Fri, 05 Jun 2026 08:09:46 -0400
Message-Id: <178066138611.3594.6559938011018564470.b4-review@b4>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=236; i=tamird@kernel.org;
 h=from:subject:message-id; bh=VgCZscMjQ1647+clqcTNC27NJ0wWuKecvNTq6Bi+QPw=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDFlKe3oy3BaWe6e3/Fkj0enSHTPnDqfOxieHljGfnbvst
 OIBT707HRNZGMS4GCzFFFkSRQ/tTU+9vUc2891xmDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 0EjHQMeYgYtTAKZa/SLDH67IV67Cs14Xh8hGStn/cmib6LnZ9n3/0Zzq6Ztm3Xv6s4KR4ZLyAY3
 98yMuZ51nytJuDC+dHntd6H/Mg46mj9uWrdz+mAUA
X-Developer-Key: i=tamird@kernel.org; a=openpgp;
 fpr=5A6714204D41EC844C50273C19D6FF6092365380

On Fri, 05 Jun 2026 11:14:29 +0200, Andreas Hindborg <a.hindborg@kernel.org> wrote:
> rust: xarray: fix false positive lockdep warnings

Reviewed-by: Tamir Duberstein <tamird@kernel.org>

-- 
Tamir Duberstein <tamird@kernel.org>
