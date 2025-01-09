Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA813219A76;
	Thu,  9 Jan 2025 15:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736437444; cv=pass; b=MB5cz/3jsxf8LMB1n63L+6dK45j5768yvsZHWlx22mSURpCQ5xXEoMQ0+IkCAarO6+EWwbjNbYbEms35ag3P/EsqV4t1ExKZN5sQiy1tARmpUtLECl3kE4AsSjVX6PrsE5QWH7dN9Y1O7MFO0Y2zA2okG95/pYyql91XdJMPRXk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736437444; c=relaxed/simple;
	bh=dTK+QOatKOLZjeFCjuikRfyxYiQGeWlEWqpFS7ySyC4=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=HCRJx7ZtwXfm9ZkobW98QBzAgfNaOm1saiqtrzzeZ3+aNlB+tup4NKvejj+WdPNjHPnjBo6C2V8334ucAL4ZC47RFA/T8bykNAYiwlYdIdsWAICiu4es/ilEx/y7vxr6gZXOdGVj5bOnKpzUb75sIIS9N5cBA99jMfFNFBB3CyI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=Rt9puRgh; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="Rt9puRgh"
ARC-Seal: i=1; a=rsa-sha256; t=1736437424; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=atZItuFVjPZNpr0dZBkidt9NvbmQTueW8gWWVlHujfEfplcwFjW4X3LoSi4Z3YydJT93pqjyFJkdLfn0QongjCNWCzwL9125h8cONuOSqjsdEb2l/T1mFnerEw/qDavAyiGDvFKHY6QwIJOtR5/lcyLliw4oYQLRAORiXRh9J4g=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1736437424; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=dTK+QOatKOLZjeFCjuikRfyxYiQGeWlEWqpFS7ySyC4=; 
	b=GmuCKc28/Qm/MqEBZY12FT8ag8F/b/oJIhRgM2o5VzskuzG9RfGW8fA/CDzgHXV92hteuzBLKLhsBrzr4QxgGAQGf+5L7jYsszYTw4SedyeAjFyW9O0kuXTZe8+w8iLmyiWl+iweqFAmdtBwaJq4AfBOIqDEqXzGBZQVx2m1/l8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1736437423;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=dTK+QOatKOLZjeFCjuikRfyxYiQGeWlEWqpFS7ySyC4=;
	b=Rt9puRghtU555lp49ymhw4FHl7nfY4OwT8VoYPMr0+pH4rtzsIoQdyXMLppEvOvl
	6Ys41RAImVrTSL8lxRKvdWMIvWHKMT6BsPNnXnwehoM6Uji7fEbuppdk9Jd2ctF1kyH
	No3KICd5+NoaDoeBNgQzkbw8oNL4nhRCs3IqVS4w=
Received: by mx.zohomail.com with SMTPS id 1736437422633258.0912629634204;
	Thu, 9 Jan 2025 07:43:42 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.300.87.4.3\))
Subject: Re: [PATCH v4 2/3] rust: io: mem: add a generic iomem abstraction
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <CAH5fLgiR0qKyFTdw0cU-G9RFMua1Eo2BD__q9h3KXqTGsH_gkg@mail.gmail.com>
Date: Thu, 9 Jan 2025 12:43:25 -0300
Cc: alex.gaynor@gmail.com,
 boqun.feng@gmail.com,
 gary@garyguo.net,
 bjorn3_gh@protonmail.com,
 benno.lossin@proton.me,
 a.hindborg@kernel.org,
 tmgross@umich.edu,
 gregkh@linuxfoundation.org,
 rafael@kernel.org,
 dakr@kernel.org,
 boris.brezillon@collabora.com,
 rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Rob Herring <robh@kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <E85B5102-8598-4A05-987F-A4BAAEDE479C@collabora.com>
References: <20241211-topic-panthor-rs-platform_io_support-v3-1-08ba707e5e3b@collabora.com>
 <20250109133057.243751-3-daniel.almeida@collabora.com>
 <CAH5fLghKfUqUNQBiGS4ORz_Ng3a865B+gjPRF4zGxJ=3VgV5Xg@mail.gmail.com>
 <EAAFB9D3-D83B-44B9-95CA-D09BE7C7F248@collabora.com>
 <CAH5fLgiR0qKyFTdw0cU-G9RFMua1Eo2BD__q9h3KXqTGsH_gkg@mail.gmail.com>
To: Alice Ryhl <aliceryhl@google.com>
X-Mailer: Apple Mail (2.3826.300.87.4.3)
X-ZohoMailClient: External


>=20
> Ah ... I don't think exclusive should be a runtime value. I'd probably
> have two types or move it to a const generic.
>=20
> Or if we only need exclusive for now, then just drop exclusive.

That was something that Rob brought up.

Rob, would you be OK with the approach above?


=E2=80=94 Daniel=
