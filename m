Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC3F31E2617
	for <rust-for-linux@vger.kernel.org>; Tue, 17 Dec 2024 23:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734478286; cv=none; b=JDHXk2Sed0SqS+DOI+DICiaOT6DCTR4RGMtc4K77tpGkN2r8PGk4J5X/TE+DoGjHYRmkOUkBCHoNBA1hgv3YBTsXn9dNxAEbn6HWGGF3doAG4o3O5aEt77KPAuTzbVXfpUuW6kLwv5TYkMgrMAiWDOsCgXdT5FGf8k3f3yh18gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734478286; c=relaxed/simple;
	bh=QdOd0cXLmdIWBZ8KDXi/EAnoSB9W/2NY1lmWnr2JM58=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nVQ/geKrFv73z2eLE6AqMlkaUOo6LdnApd0gUhTkJaIJIQ+gJqEsKJFFXkgrfbjUaGbAlbyDznQMNZX3TxKNm+9TzfJf3Ese86TyPDtCeeuePzxyTTGhr7AVb2CGRdidyfemgV2qMRqZj3eJKdaol7tjO5G+OmAzeGlxvc/BoGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gxZaOVAB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gxZaOVAB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DAEAC4CED3;
	Tue, 17 Dec 2024 23:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734478285;
	bh=QdOd0cXLmdIWBZ8KDXi/EAnoSB9W/2NY1lmWnr2JM58=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gxZaOVABEODxLO1L3zzvls206z1WY0+RB/3A5PDueH6//UkuoRjiOeVvZTQOJPlFh
	 tlOgZYJ2CENM9tGGqt4qZbdKEu60etwd5k9MwRuxZdt4EcaIu4EhMSIaOAeVeq8Rhe
	 jkMrpMBIF6KwbGKTN7GRxoYQz4wJuqYZ+ixBxUSvkYx+ZtZohroLGIy49fPQY5PWDA
	 pRIQyDT3fcfUVMvXnjTkFxZUEyFi8NoxozIdsV6Lutyhe533YfUGUcTBIah/PpiBfH
	 UgKW044qV/buHzuoj4mOASFpsIdxc9HvjJxATLbpcLgZ1RH9Csy+gfDqgpBB8MGfPj
	 V8aEQ/NLPbUow==
Date: Tue, 17 Dec 2024 13:31:24 -1000
From: Tejun Heo <tj@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Dirk Behme <dirk.behme@gmail.com>, rust-for-linux@vger.kernel.org,
	Alice Ryhl <aliceryhl@google.com>,
	Boqun Feng <boqun.feng@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
	Trevor Gross <tmgross@umich.edu>
Subject: Re: [PATCH v2] rust: workqueue: Enable execution of doctests
Message-ID: <Z2IJzIkEyxQsxL3A@slm.duckdns.org>
References: <cb953202-0dbe-4127-8a8e-6a75258c2116@gmail.com>
 <CANiq72kQAKeafOhh7iYCPMboPTWT+pce0b6ZgJodoyAy7Cj=dA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiq72kQAKeafOhh7iYCPMboPTWT+pce0b6ZgJodoyAy7Cj=dA@mail.gmail.com>

On Wed, Dec 18, 2024 at 12:23:47AM +0100, Miguel Ojeda wrote:
> This looks fine to me -- Tejun, are you picking it up? If so, please
> feel free to add:
> 
> Acked-by: Miguel Ojeda <ojeda@kernel.org>
> 
> Otherwise, if you prefer, I can put it through `rust-next`.

Acked-by: Tejun Heo <tj@kernel.org>

Please take it through rust-next.

Thanks.

-- 
tejun
