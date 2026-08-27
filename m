Received: from sender4-op-o11.zoho.com (sender4-op-o11.zoho.com [136.143.188.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 230922D5926;
	Thu, 27 Aug 2026 01:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787792451; cv=pass; b=UvIAE/DQMiZmDircOiX09AgNT4d5Ufn7F3IBLErRCcfR7aYaGOGvLYqJrm5sXwLWqVR7DMgFyna8bTXB/cpC2srZwhH8ih7ZhN4oVV7FgFsmVUk0Jtk8P74kwJic2XBBRjy5HlVLB+2DPtW91CvsV4iL8QtUulDxxuVBOYIJj0g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787792451; c=relaxed/simple;
	bh=aTrG2U3nnsahZNHEmxNMi33V9p9IP53O5HAC6ElbmRA=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=DYAC7PosPNMLjEcr0kFxI0qbVwbsd71pEaTVuGpsnJ/WcdAA2aUN+i6j+pm0jbHy1K87PeFs4v3zF1ny6Wk6iomv56JsK9J7BPyWHQrsdjZxTI5we8+1vhPWmv0Q1I1t7lAN/Gspo9+0DpQTYoH47dG+Plde7XYe3glLE0a/PAI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=iT6QIgop; arc=pass smtp.client-ip=136.143.188.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="iT6QIgop"
ARC-Seal: i=1; a=rsa-sha256; t=1787792388; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=CBO3da8lJVg2B4cJHrUIFYyYxtxZUkd1VtjRKcZZeAba59FmtEtB34kNhYL845cMrkY9C786k5pvyg6X8Ka3+Iljy1iJjL506rCt6rOpizQRm/nBREw5E/cfY+FQsYbeaVzXLz60Sr8QB+vnZ34fE6jqOrvmy/mHD2J/jyNLJic=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1787792388; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=aTrG2U3nnsahZNHEmxNMi33V9p9IP53O5HAC6ElbmRA=; 
	b=YZJ7E/HWryfyLI2gIgGjq/Ou17+oOhS0oihX1NJhbGVIKdn/MFaMztKIfdPw/lpG87Ln99tfomyOgGhE1Q5wFHflFWk8tYdR6HWY9NH1PDU6DZ6V1xt+0MymX3HgYYEmC6dwpM0PZ6mM/setECrHCtmirHuUEFHd9NYfZk8qPZE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1787792388;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:To:To:Reply-To;
	bh=aTrG2U3nnsahZNHEmxNMi33V9p9IP53O5HAC6ElbmRA=;
	b=iT6QIgopJbHL0/Egv2fhTRLQq1DqymZj9fhg6DoKt4q/Xc05QYpFn8+wwa4QHc7z
	VmF5VNmT6yDICFCa3xJohEglBjblnHEeqtAUzzgIBh7H9cC14koHC3zSUUPfwEDVM6X
	b2k+09Hb5bUBMXda7EfiIeA1vx8VBfldQFtQ+TPo=
Received: by mx.zohomail.com with SMTPS id 1787792386008226.5796055590763;
	Wed, 26 Aug 2026 17:59:46 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v4 04/11] rust: xarray: use `xas_load` instead of
 `xa_load` in `Guard::load`
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20260604-xarray-entry-send-v4-4-965f6028790e@kernel.org>
Date: Wed, 26 Aug 2026 21:59:25 -0300
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
Content-Transfer-Encoding: 7bit
Message-Id: <CEF7AC1D-4899-4EF2-8034-DBEACBA909E1@collabora.com>
References: <20260604-xarray-entry-send-v4-0-965f6028790e@kernel.org>
 <20260604-xarray-entry-send-v4-4-965f6028790e@kernel.org>
To: Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
