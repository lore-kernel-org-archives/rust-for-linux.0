Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B469F2BE05F;
	Mon, 20 Apr 2026 22:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776722505; cv=pass; b=hO+Udtft4XZ8wP/2hHxJqklb1fODmoXewIftIt9T6DAs9v5V4axTDtyywsQVIBgfaHF3GSduhQWoS0gz5r8OxPZJpdQIYYOHWra3DZa8YWLsoWrSVRY59wSbPwdldvy2GhdQrDrD4d1A3TVdLbMudxxndFc2zVNMJiRIQhNQsJA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776722505; c=relaxed/simple;
	bh=oBlhaavuSYjsLYtQVDj0EHdUnJtrK/fCKJdQ57LVZuc=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=uPMLttUJezNNHXKkmixsBF9PNlsZtNZytedIWUjqAg1g/4/z5rtm/mOrEfIYn8E+9dACX1cCM1Fu6cE+Ufm/tRvJxu3evoETRkAsmeMRIc5vbF3n5XNlD9nYn5fV+QTGqmi++978fYkfgDrmkMt2L3VFb32O9FXkwlG1e+uda2w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=OrK2czLL; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="OrK2czLL"
ARC-Seal: i=1; a=rsa-sha256; t=1776722462; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=QQeklhOmcfQhHpOqeaUrQlrqN5TpzD2cen8E28/xq6H2D15Mxc0X4wPRWgh9KBoF3wqGDo0eADFzBDu30roffMVKJ4HNumzf2bHuA9MsAhMXqauQvwwJzkgFbIixv8Xf1EB45Y0AQ2cHiaou3cthT5yidDEZsJi/egTXBJsBJOM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1776722462; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=TPga7OWVWK9CPNc1ExRbZ12sx0lmboJVe6WZzRlIwEA=; 
	b=jitmWlwk0j7ZXbuKE97fyK+apf4tGpUAYU6LvTt9HCmPbYcsQ2guUA8n0Q18LKTB4zRAFFa/X8ssRF56VuDGqTj9G1cT2PAhcnmCcjcpwyOe6gocDX5MLsymPTAXebrgBE35pgrmBisc0oZtLmm2R7ZmgQ2HkwulqIFv7Wk764I=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1776722462;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=TPga7OWVWK9CPNc1ExRbZ12sx0lmboJVe6WZzRlIwEA=;
	b=OrK2czLLpJYU1niTRrDc8XSf7Zqz0lh5XicgKJ0zfc66Qn/xgK4pulG2ZmsmC/Kq
	2khVp8yluTwHsUHDT7G+x73kMh3IYFOtB6U0UqrKq/iIArvZEfudrHhsn82yLVK2aB4
	bzaHkSe51YMSo1vFgbEjUxQUzNyN4jJsqlAfP+Ws=
Received: by mx.zohomail.com with SMTPS id 1776722459538816.0848615690371;
	Mon, 20 Apr 2026 15:00:59 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH RFC] rust: maple_tree: implement Send and Sync for
 MapleTree
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20260420201040.1894760-1-joelagnelf@nvidia.com>
Date: Mon, 20 Apr 2026 19:00:42 -0300
Cc: linux-kernel@vger.kernel.org,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Alice Ryhl <aliceryhl@google.com>,
 Andrew Ballance <andrewjballance@gmail.com>,
 Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 maple-tree@lists.infradead.org,
 linux-mm@kvack.org,
 rust-for-linux@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <81F4369C-358A-40B5-81F9-24D84483D00B@collabora.com>
References: <20260420201040.1894760-1-joelagnelf@nvidia.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External

Hi Joel,

I think there are others in a better position to review this than me,=20
however, while reading this patch, I noticed this:
>=20
>     #[inline]
> @@ -302,19 +305,31 @@ fn drop(mut self: Pin<&mut Self>) {
>     }
> }
>=20
> +// SAFETY: `MapleTree<T>` is `Send` iff `T` is `Send`.  All access to =
the tree
> +// goes through the internal `ma_lock` spinlock or via `&mut =
MapleTree`.
> +unsafe impl<T: ForeignOwnable + Send> Send for MapleTree<T> {}
> +// SAFETY: All shared access through `&MapleTree` either acquires =
`ma_lock`.

^ Missing something here? Either =E2=80=A6 or?=20

=E2=80=94 Daniel=
