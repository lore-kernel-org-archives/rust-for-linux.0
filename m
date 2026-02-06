Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E6883644DB;
	Fri,  6 Feb 2026 13:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770384518; cv=pass; b=PJFAgu6deBOOYEnamFbKlhYeI/IwP0ijNlAsMhkUCQE9m6/aMRUiXJMu9k35AMY+I/UkUTJLaMw0vUTk5GOUfOfTAiucx4y7p6zxjPcnY5vAJOb3mo/wdSqDKElP4j+thOZtXbzAdwOKSbmkXRtsP0U2454Sl6AgcIaytr/EUbw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770384518; c=relaxed/simple;
	bh=aTrG2U3nnsahZNHEmxNMi33V9p9IP53O5HAC6ElbmRA=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=J7R3arC8NiGkoh298Gfj7UvjhyG4/8sPcvvceysmwZ4aNBpFhWMXoej4btQAp34SLWXdlB6WGp333f0Ha+PtlU4omeZTRf6gBUy+U9wkzqucZyFyZapyA4ImQ8OPVKELomcR2ja8aZ6YsL8LvLAec/hqHH4MunCN6Z4cUPLMlOI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=O7vHgqbv; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="O7vHgqbv"
ARC-Seal: i=1; a=rsa-sha256; t=1770384509; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=VvflCfu5Tlwx84cmJdYAuQfS2uvXaUWEaAod4Yk6BB5QtEPQjE2HOXRJjz+lBhAS/XGdE4SiNG+xpR5/AM3ISc76a94DBLhp0C4FuQc6gLYNcwKZvpg/6wTZpHso+q2wSaE2FmWDnUh2GnGsC75iDEkzR4/FJKPGeWTib2+aDmk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1770384509; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=aTrG2U3nnsahZNHEmxNMi33V9p9IP53O5HAC6ElbmRA=; 
	b=EfZok/MurEDRcV1mDJp4vz9cTk4a2xijlpkpmdsVGM6P9m8C7+PMkA6HEV7bucRciNnajsbVOWz063mLHKErmITDQ/Xa9VIJg65dBrRMxQgus5HDU52AT+uvO5K+rh6BohrayDR662XP15bLxt5RAgsMJdm4MJMjV2ayPcz3qbg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1770384509;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=aTrG2U3nnsahZNHEmxNMi33V9p9IP53O5HAC6ElbmRA=;
	b=O7vHgqbv6LjWjy6Jmk+Y49oY1nH3B84GIMEaiiLmr2vgzCF1u4R965JzKG6WauAv
	122Yn0PEJcQsKSPFhKGqDHNcwb6wwWgOaHVlbc+p4rTpw64OwIU0nJ0M9Idyvu2oq41
	FEVxovs7mLRSqkQlBooHMIgLqiB+4ew0nniNg4Gg=
Received: by mx.zohomail.com with SMTPS id 1770384507352128.09159677504636;
	Fri, 6 Feb 2026 05:28:27 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v5 1/4] rust/drm: Introduce DeviceContext
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20260131001602.2095470-2-lyude@redhat.com>
Date: Fri, 6 Feb 2026 10:28:10 -0300
Cc: linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org,
 Danilo Krummrich <dakr@kernel.org>,
 nouveau@lists.freedesktop.org,
 Miguel Ojeda <ojeda@kernel.org>,
 Simona Vetter <simona@ffwll.ch>,
 Alice Ryhl <aliceryhl@google.com>,
 Shankari Anand <shankari.ak0208@gmail.com>,
 David Airlie <airlied@gmail.com>,
 Benno Lossin <lossin@kernel.org>,
 Asahi Lina <lina+kernel@asahilina.net>
Content-Transfer-Encoding: 7bit
Message-Id: <5C67228A-B017-42E7-944B-CAE517F7AACD@collabora.com>
References: <20260131001602.2095470-1-lyude@redhat.com>
 <20260131001602.2095470-2-lyude@redhat.com>
To: Lyude Paul <lyude@redhat.com>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
