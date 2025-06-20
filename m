Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1A6128C2B5
	for <rust-for-linux@vger.kernel.org>; Fri, 20 Jun 2025 13:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750426979; cv=pass; b=RfFU7VnJrhJRFKTBpCMu84HadmghQEiqKUDBAE8kqd1ot2FZz/C+YOhd/wUU3zf1iVSN/X1wo+SIZpAbgGPT/taVK5B+DAz5PqTHVKa3qQ0/LFACJWT+17qqFlQJHnHjGr0PMM1ahaos4uVglzL8BIaqOJXdcGgf27ilBfLFBp0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750426979; c=relaxed/simple;
	bh=mDliNZjN0LQ2oSXKvbbYIgIMGFlBC+bFTX0MfjIcjuw=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=QWdhEQAXjV+aHQuTc8rjHycpUzlMXdFjhLQLGpjflLCixJ+46NSTV+UKdGIlXk6Y8m7X8Zlhsz9Ey5HFWbPJdGpANwFG7VEjXBQUkGTWl26plE7EpKkGZxevBHUjMgWBb5DInLqOPUf24nx91veNnAEgNYo3WYxr/g/pNFFKsOw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=M5/miJYU; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="M5/miJYU"
ARC-Seal: i=1; a=rsa-sha256; t=1750426948; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=f6hoq1KduJGVvC3tyfXlC3vS2PCHfT2tbNKQZ0coR9uNefZ4X7e906afL9MOKyP7WL3pLQee/9IsUMtGiuP05Fvca51CZBsOETJTUtLgYOW8D4m3yivT+Q8LLimn7+ELg5u3Qpuhg3nf4mHT0g41aEHRnKWgC4Ny5T4P7eW7JBk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1750426948; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=KDCFKsKcyeIIzEy/lqv2lQlFj4SyqbS6lavMWO1IBd0=; 
	b=ZB504/Apa6uh3pv2Bg4NTJ1nHut6ni3mA9KZc2r1op0XAr/x8NQyY5tm8Sqs5XTrsq4DiVY5Y7fB8ucO55aWOG4CKfp6gvIh9A2N5z75EQ+reNmKpgmXEBsYmG/hTl/vGupECMZpr994SjacRH/4ueqZyigjcjcHblyfUWeQhTc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1750426948;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=KDCFKsKcyeIIzEy/lqv2lQlFj4SyqbS6lavMWO1IBd0=;
	b=M5/miJYUM5spp67kkinurcfxJEEF7xkfvZcUNQK9/pA8LcHul26TIWxTDjmynfRV
	KbGVF6uapnuP0fOsQO+XPG1qdI9cz44FtH1KYYDnlp2C8mii3WuykKOjn/ZK1jouSy1
	vxoaqDGDYFCaAgcLxqeVH+rQ0lJ+3atoCuaJ3aHQ=
Received: by mx.zohomail.com with SMTPS id 1750426945400308.2619948150958;
	Fri, 20 Jun 2025 06:42:25 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.600.51.1.1\))
Subject: Re: [PATCH] rust: drm: Drop the use of Opaque for ioctl arguments
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <aFRi8cqkIzOAIbeR@arm.com>
Date: Fri, 20 Jun 2025 10:42:09 -0300
Cc: Benno Lossin <lossin@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>,
 ojeda@kernel.org,
 alex.gaynor@gmail.com,
 aliceryhl@google.com,
 boqun.feng@gmail.com,
 gary@garyguo.net,
 bjorn3_gh@protonmail.com,
 a.hindborg@kernel.org,
 tmgross@umich.edu,
 alyssa@rosenzweig.io,
 lyude@redhat.com,
 rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <49BDC70A-7CBF-4C2F-955F-B680DA0BF30C@collabora.com>
References: <20250619102102.750668-1-beata.michalska@arm.com>
 <aFPsjIFIC1J2qtdc@pollux> <DAQGIG20TJV6.3O4G0F4O72327@kernel.org>
 <6DB37626-8817-4939-AE8E-6A463186A550@collabora.com>
 <DAQJERHUYQF0.2SVXG825J6Q9N@kernel.org> <aFRi8cqkIzOAIbeR@arm.com>
To: Beata Michalska <beata.michalska@arm.com>
X-Mailer: Apple Mail (2.3826.600.51.1.1)
X-ZohoMailClient: External

Hi Beata,

>  There is no concurrent access nor shared references, unless the
> handler decides otherwise

It can=E2=80=99t do so in safe code. There is no way to manufacture a =
shared
reference from a mutable one in safe code and if it passes that to C, =
then
it=E2=80=99s already using a unsafe block for the ffi call.

Unless I missed something?

=E2=80=94 Daniel=
