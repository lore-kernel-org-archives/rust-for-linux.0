Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB629221D92;
	Mon,  1 Dec 2025 22:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764629735; cv=pass; b=DTrZ/0gmyfuAs2F/v/hjy6hdmK5VwaOTk3/0zEh1B6UZBKMlpFtSGgLc0m0Ifx9HWwTWjYkOYy/2I2YEVgDHhiEHtnfGghyL6QmPYobXu64dlZVMyAF5DQmJZZ1xc++AoeYmnq0VxqA372uLPO2iBb4ZJs43gROolEmN69nUNLQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764629735; c=relaxed/simple;
	bh=1Wy5u3DNvQwbxFZGLQgKlWKm5gcWutmTaFp8tL2MP9U=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=CApypfDFw0vg6R2SnG1Jykz4OE2fGazPzo0CppZF4Xi9Fq9kBospG5nZZGsoU5Mkci9qKxnrMakD9MUSyq/WIJdSS2n9+gMrFaRmBVS1wBrUjcPRx/IU/hfZWGIlDw7tixr/wGUkebFWyQ2RYCEDD5+U4en1gDEm6ENfllTDlh8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=bYDKXHai; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="bYDKXHai"
ARC-Seal: i=1; a=rsa-sha256; t=1764629708; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=WUUlwegPL+TaM1SCSPVueIIpNkDW8TM/B1c2ED/rd7bziI0UVJ0mVjiPfMeLQBbKP9ggr/O1CnMa2Rz1lYH/VkBct5O7jxQX+wmXrjD0DjzVmCIUJELiI+Lyn+NwgMwQ0BngLOF7vzO3iUPgRlNzVTB3xfdBaaQY2Tb8/ONtp30=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1764629708; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ypRRmD2xCCGEl+qbk0MV7p2Ceeb2oGK2vSUVjqR1prk=; 
	b=QMSshcslQMhtS/QxlpqIpp+0eIELmrIWAAQ1hwwdgx+6wh2avbf/LdgLTOZlkXhk+7tefC596uNMPsAL6sJAwpGuAlo63Rx1U4Hf1vLcXsiaKa6xfBK4g+Z5N563K2Kw13NCF8n8KzGwYZJfODuGutlt79he5d6NWUtUapnLuqw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1764629708;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=ypRRmD2xCCGEl+qbk0MV7p2Ceeb2oGK2vSUVjqR1prk=;
	b=bYDKXHaiL/nCoFUsA21cGFvl+BM5+e/nle8+/LsCBJ1cfSELuLvQIQnU7EB0cLNk
	M8yHl+vEIjTfcFrF6LVm4gfUmnkVgh0U/fzCfRRZOurLRTbLJWZ/cJFik4o9qHjErJS
	Sekn246SE48RQ0bvkzqYb+F9kjW9N6Fy6ES6muno=
Received: by mx.zohomail.com with SMTPS id 1764629706021913.819960823426;
	Mon, 1 Dec 2025 14:55:06 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v3] rust: clist: Add support to interface with C linked
 lists
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <87d2c2d5-12d2-4655-b070-872c909f7e0a@nvidia.com>
Date: Mon, 1 Dec 2025 19:54:49 -0300
Cc: Joel Fernandes <joelagnelf@nvidia.com>,
 linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org,
 Danilo Krummrich <dakr@kernel.org>,
 Dave Airlie <airlied@gmail.com>,
 Alexandre Courbot <acourbot@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>,
 Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 bjorn3_gh@protonmail.com,
 Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Timur Tabi <ttabi@nvidia.com>,
 Joel Fernandes <joel@joelfernandes.org>,
 Lyude Paul <elle@weathered-steel.dev>,
 Andrea Righi <arighi@nvidia.com>,
 Philipp Stanner <phasta@kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <48EFFE1F-4D20-4A2D-B3E0-13E9CB796624@collabora.com>
References: <20251129213056.4021375-1-joelagnelf@nvidia.com>
 <5B89D953-BB52-4E8F-AC40-1FA33C016780@collabora.com>
 <87d2c2d5-12d2-4655-b070-872c909f7e0a@nvidia.com>
To: John Hubbard <jhubbard@nvidia.com>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External



> On 1 Dec 2025, at 16:35, John Hubbard <jhubbard@nvidia.com> wrote:
>=20
> On 12/1/25 8:51 AM, Daniel Almeida wrote:
>>> On 29 Nov 2025, at 18:30, Joel Fernandes <joelagnelf@nvidia.com> =
wrote:
> ...
>>> +#[repr(transparent)]
>>> +pub struct ClistHead(Opaque<bindings::list_head>);
>>=20
>> I still think we should call this CList. IMHO, it does not make sense =
to have a
>=20
> I am guessing you meant to place this comment after Clist, rather than =
here
> (after ClistHead)? Otherwise I don't know what you are actually =
suggesting?
>=20
>> Clist, and a ClistHead (notice the capitalization). CList and =
CListHead are
>> easier to read and reason about.
>>=20
>> Did anyone push back on this?
>=20
> If you are simply recommending renaming:
>    Clist     --> CList
>    ClistHead --> CListHead

Yes, this is what I meant.

>=20
> ...then I'd say "+1" for that suggestion.
>=20
> thanks,
> --=20
> John Hubbard
>=20
>=20

