Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ABD74A99AD;
	Wed,  2 Sep 2026 15:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788364729; cv=none; b=J8feNw48Hwjc/RZKL8jdzTDJYJuzM2vlnCDvG/p6AoVh3T7S4Yw9mjCXd3iw6CQThv2EH3iW4+nVF3C1rwX2fEiOdLLYMD2jz9Pz5D60RtAOPeT1pLlGV3djk5s+xXlacAhv483rFqk9olXzTCEtGNADLSd9GFaNOHzufEOB0ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788364729; c=relaxed/simple;
	bh=wKlwaQkQAz5kG6GLoQ4K83PGJqxxn86m6LCqEUyt2GA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kKEXpnoAiMEurKskR4H8uOjUZ+J4p8Gh+XmSQw4zWJ20iCM21H+lczT+wlsE5Gqtcsn5qL6DfEgddaiicao4BmuqmvfnF1hX331Hd382Rvo4KinjMy/5mXak6vOTZgc4Ofdt2DKtYa32Mi+ScmjtKpsnWgqK6xyKYp6CvCuNIYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f08KDV1o; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f08KDV1o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D2001F00A3D;
	Wed,  2 Sep 2026 15:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788364726;
	bh=SXckRdgt9tPCdpTYHPbhaQaqM66BIpLSMj+7V95uMCw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=f08KDV1ohSqnuZAgTGc7w8uO6JPUMaE7h7Bin0UkHIhC7eaii12dhX61PdKwsKeHe
	 HssFw1OAWKUJm9f9Lk+COMVE5kyijJ5NHL6sI7bxCtmH9LRLIHawJ1m3qv+mgmctrY
	 rW5dGjDXzJSvxpbryL7PfANNSsw2xdw4n2pTNNIDVFA0t5kpauS1mqebrGFscCHz3P
	 pbTX1P4RJlcOlFWouytYsvKZsCjX1A7nNALk+qBB/5tHfB+LeclOJrtVue6vltQJ8M
	 AwEH7r/BAQGB//J/31GkjEWLdQQYQE3XpoxhHUN3oDTybhJrZNtg8HnE/thaPZm6pd
	 wtmOVvNaoOV0A==
From: Danilo Krummrich <dakr@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: aliceryhl@google.com,
	ljs@kernel.org,
	vbabka@kernel.org,
	liam@infradead.org,
	urezki@gmail.com,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: add Alice Ryhl as co-maintainer for Rust [ALLOC]
Date: Wed,  2 Sep 2026 17:58:42 +0200
Message-ID: <20260902155842.1649192-1-dakr@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260826132729.3281308-1-dakr@kernel.org>
References: <20260826132729.3281308-1-dakr@kernel.org>
X-Patch-Reply: applied
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Wed, 26 Aug 2026 15:27:18 +0200, Danilo Krummrich wrote:
> [PATCH] MAINTAINERS: add Alice Ryhl as co-maintainer for Rust [ALLOC]

Applied, thanks!

  Branch: alloc-next
  Tree:   git@github.com:Rust-for-Linux/linux.git

[1/1] MAINTAINERS: add Alice Ryhl as co-maintainer for Rust [ALLOC]
      commit: 82134823a07b

The patch will appear in the next linux-next integration (typically within 24
hours on weekdays).

The patch is queued up for the upcoming merge window for the next major kernel
release.
