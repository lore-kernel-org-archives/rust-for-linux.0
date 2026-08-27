Received: from sender4-op-o11.zoho.com (sender4-op-o11.zoho.com [136.143.188.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6E0E25B0BB;
	Thu, 27 Aug 2026 00:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787792203; cv=pass; b=WkUo8uxNCZZkKhHxfIbu1mQ/wPdaF5X/0qI7B9W7IT/NiC2ePKmAWhQcHPFNlOeH5M2iOB60P88HMW9leA8HBsojbukg43hkKrZ3eHPaVYaQcf+WOm6zOIf5XmU0eItASo1oFlFZI1773fcX3Sza3uP1/9EhZw04Buba2s7Df0I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787792203; c=relaxed/simple;
	bh=+LrLE8+rJtI76h8J7YNnJ/2iFK09dqNEr+r/n2j1rL0=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=N9RtCQY00pq55bP/pCVAvJsrXnO5KeefufyjzfMSStX+c64U1G359Gu3QNKLoQua2eXzXliQh6isnSaN72SuHdwJuxfWixJokUdfT7Z3qH/Qc+ApwWoY74RxBzKRKrT33zELS71S9uUzeWfm1YdQeOhIK8YNQdildEVTU0j/5uA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=jX7MyS9U; arc=pass smtp.client-ip=136.143.188.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="jX7MyS9U"
ARC-Seal: i=1; a=rsa-sha256; t=1787792151; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=IJg7DN2ynBoKLJxuLdPi/98gMDxeFQlNBrjpW7l0d4kvH29O2TkVwNnjuAUZaK1M1BfEjeVA969J0SbP1VAP22P8pSIpT7/YLuOqZgxCa+rTHRnV9mW8oi6fXmckROaQim+VZJ+n29Y5SAEeAeWiwDGOr97WTnHnFffrWJIWDRg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1787792151; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=+LrLE8+rJtI76h8J7YNnJ/2iFK09dqNEr+r/n2j1rL0=; 
	b=Vk6BWSwF0De1cG1FHIjoEsFM5KXFv/MVgKkfRwNhS0qqPxlPa619F2yvRyPVILUA8Eo+2trp7oYgHCdxWO5Da30X/rBQhqoyU2LlIkbBVtsayBciGpUzfak0yCclEwf2nIlGJ4VvVdmua4NgKI6MIWdpqHxY7r11hg70iDeoYDk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1787792151;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:To:To:Reply-To;
	bh=+LrLE8+rJtI76h8J7YNnJ/2iFK09dqNEr+r/n2j1rL0=;
	b=jX7MyS9UBkYiXyxmJjm2CtrFStlSKhzaq2fMYbOFFH3qx49LvYU/mWlHsmdYtAHO
	zsmWC/M6ZdCtPDIXZ09Y3rymqZY/nWmYsUhjsqxV6yE4DSXi72b9drHzSDmpmDJV8bj
	7z2dCfy0ql/D2KgOpltrebaN2ADQgA8oAbe8MRWk=
Received: by mx.zohomail.com with SMTPS id 178779214921797.4098834851884;
	Wed, 26 Aug 2026 17:55:49 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v4 03/11] rust: xarray: add `XArrayState`
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20260604-xarray-entry-send-v4-3-965f6028790e@kernel.org>
Date: Wed, 26 Aug 2026 21:55:29 -0300
Cc: Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Christoph Lameter <cl@gentwo.org>,
 David Rientjes <rientjes@google.com>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Tamir Duberstein <tamird@kernel.org>,
 Boqun Feng <boqun@kernel.org>,
 Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>,
 Harry Yoo <harry@kernel.org>,
 Hao Li <hao.li@linux.dev>,
 Daniel Gomez <da.gomez@kernel.org>,
 rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <66630DA9-0546-4211-BF30-C99123B76E5B@collabora.com>
References: <20260604-xarray-entry-send-v4-0-965f6028790e@kernel.org>
 <20260604-xarray-entry-send-v4-3-965f6028790e@kernel.org>
To: Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External

Hi Andreas,

My main worry here is cursor invalidation, i.e.: what happens if someone
mutates the tree while we have live instances of XArrayState handed out =
via
patch 7? For example, what if someone writes =
"self.state.guard.remove(...)"
inside the kernel crate itself while some user code has an =
OccupiedEntry?

I think this could be solved by hiding XArrayState in its own module and
exposing only a small set of checked helpers while its fields remain =
private so
that we carefully vet against the situation above.

Additionally we have to ensure that, in order to get the guard, one must
destroy the XArrayState, for the same reason. This is currently the case =
with
into_guard() IIUC, but I think it's worth to spell it out in the =
invariant section.

=E2=80=94 Daniel=
