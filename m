Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2CF16F06A
	for <rust-for-linux@vger.kernel.org>; Sun, 28 Dec 2025 14:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766932130; cv=pass; b=Uv8KJsrUG8C0AddHMnIH979q5ZaYi7QWA9TevL0hGqkhEy/htfyj0suGH2qtfbZ9lSuNZCdzAJcK+3WjlEKHO+9j/4lDbSU19Doq/lwQK7iJufgi/71/Rnq5jLe7aNrdZ1g863G+CJoAjlJTZ7DYlNo+EYcaJfTrp9YJLGTP+JY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766932130; c=relaxed/simple;
	bh=dYITVmzi1GQ/9TmDTHXnP5XvJ/0kRM0fuAdHUChVRP4=;
	h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:References:
	 Cc:In-Reply-To:To; b=bDUoJOi2ItCAoWeGwQmOqSWc5Cs547caWTZTJZe8gXDBq/32Vj8ZJx1I0K3UDKENs0Xj3SAmzns3El0PFdGNYr+Uq3z0bbjcMT6EyLJrGqSu6YkkheC2T8tagJgsjwGEHKh9RicuneyAZ0s/9g3pbbyXHhnM50nxMS3+ZJvkR9o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=TmaamLkW; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="TmaamLkW"
ARC-Seal: i=1; a=rsa-sha256; t=1766932106; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=CDtvO/2793tGoy7aZh/7tAalQNC3h00hxG1Dc+QgtLFDXd7kPgzWFfkU6mItmP3/Rc97IEv5rkPRRKyFTY9PHomOFyyPYY8S1Y5o5y6DKg5ZCZkBDJ3Ed7nC6F2zMYFMNItKEtiUdq7UUcfbMmqpdPbwuXxE0aXURDyjxACHtec=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1766932106; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=dYITVmzi1GQ/9TmDTHXnP5XvJ/0kRM0fuAdHUChVRP4=; 
	b=cJb/q4YMrpops3971V1NN3dqveHrVZcvoNzqc9Ep/ocdaGRFasOe3VTSt/ePnZMN0gCTwzsrDy0nJZkoHrVMcwbQelBcJJVorcm8BRsLN1mIwyKmM98+6arRrdUNTD2DQ53Sa3DzVUCQHnKbPFWihx0AfJtN7wkq5WxOc/fj6dk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1766932106;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Content-Transfer-Encoding:From:From:Mime-Version:Subject:Subject:Date:Date:Message-Id:Message-Id:References:Cc:Cc:In-Reply-To:To:To:Reply-To;
	bh=dYITVmzi1GQ/9TmDTHXnP5XvJ/0kRM0fuAdHUChVRP4=;
	b=TmaamLkWcj7IbufQu/a2GOELPxDoI8+xla8OvPzMoxRKZrSyuu5qTbosfEVmS8V0
	phjeClUd8z7bwhxfO4VsKhP7fIRToT+0fIgMbHJ56RU24QINex0pNlLdlTYfWAZ3Ogw
	FXdBZ4KGhiJVR1Vw27VXIAff2ilicy22xoodg3l8=
Received: by mx.zohomail.com with SMTPS id 1766932103678401.45159038746215;
	Sun, 28 Dec 2025 06:28:23 -0800 (PST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Daniel Almeida <daniel.almeida@collabora.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH] rust: add a function that returns a reference to the IO Ports Resource
Date: Sun, 28 Dec 2025 11:28:07 -0300
Message-Id: <60FCBCD3-6793-4FBE-81E8-656A3E33050A@collabora.com>
References: <2D747CAA-01AA-4417-A4E9-A3ADD12981AA@wyliodrin.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 Bjorn Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org,
 Fiona Behrens <me@kloenk.dev>
In-Reply-To: <2D747CAA-01AA-4417-A4E9-A3ADD12981AA@wyliodrin.com>
To: Alexandru Radovici <alexandru.radovici@wyliodrin.com>
X-Mailer: iPhone Mail (23C55)
X-ZohoMailClient: External

I=E2=80=99d reword the commit message, by the way.

Maybe =E2=80=9Crust: io: add Resource accessor=E2=80=9D or something along t=
hose lines.

=E2=80=94 Daniel=

