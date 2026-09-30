Received: from sender6-op-o11.zoho.com (sender6-op-o11.zoho.com [165.173.180.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BABCD4CC63A;
	Wed, 30 Sep 2026 20:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.180.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790799945; cv=pass; b=SgC7HrvoTaPenwCkxGJ8zHSneOcujkbEiCykrviyazFZq0hY+OiJC5YTZLAwToCzeOE0vKYCLu8KA309KB5ckzkcqWJToMcE42FMVzh8EzgV7CCtB3QmbuOYXomAqRJy2GMhv8HJdCPdxF7kv90sN5ms0HxOGOPspN3DntS58bg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790799945; c=relaxed/simple;
	bh=aTrG2U3nnsahZNHEmxNMi33V9p9IP53O5HAC6ElbmRA=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=dXpNQqVD+4vE5m+xcHa1ovjq+HrE2zFyBn4l6PWBir6kBqMJkGfYBUryQn+kDVCjMGPmKoyYqqipSiW0YPGH1xh+CziKUt5dHNxXO6jdNW+NLWK1nZpbPNPdIBHvLp07xe+AmP/2jwBOWz+f+bqK6iCv9veMH2hvz1w/n9k1cng=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=AYqjShPI; arc=pass smtp.client-ip=165.173.180.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="AYqjShPI"
ARC-Seal: i=1; a=rsa-sha256; t=1790799904; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=lzeYBR8uf9huZmMfUHTKb1t6w6+/X+wLVvsqsJ3tZ3QxSphOg1UMxhK2UNKoN/uZnOFjVXKF6UUBSaxEVJr7s5Wlq0qUNFdAzLpIBEUOwpw3/PuAZ2mB2k/bZhyo0QsJVczsJNtcxBBkr3d/KcoxYAfGGqbULtyEcNSZIHM1PmA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1790799904; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=aTrG2U3nnsahZNHEmxNMi33V9p9IP53O5HAC6ElbmRA=; 
	b=Li/7ZTbAU5Dk8/VFFhzjlIdVJ1pT5k4Hfi21kDsXHFHBFQ2AMjqJYffwjYxbd/C6mNwS42rdHKbKJxVuxpZvhZ0ce0CQyJ3T1/FORK/rrQ/tCwD8PnAFQC21PPUAQXW+vcwXWUr+99RT4IpIwf2+0/nBOM7erq52lTD2+Hb2KdE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1790799904;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:To:To:Reply-To;
	bh=aTrG2U3nnsahZNHEmxNMi33V9p9IP53O5HAC6ElbmRA=;
	b=AYqjShPIjzyfGGeL7bxKVdknBD9x7oQ9y7GlryzJv+XDtMOS7XTj3UUqeQtpOl5g
	tqgvd+EUrSoOejSLaR+Jzh8vjCxjxJeGglWFjKV3uSjrogC44HhFTJlN+/rNzidA1O/
	YlSzY+RVedWb7k4UeX9bCQLZFZUQz2jOGdHatHEI=
Received: by smtp.zohomail.com with SMTPS id 1790799903695712.2482650417286;
	Wed, 30 Sep 2026 13:25:03 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.100.1.1.11\))
Subject: Re: [PATCH v10 1/7] rust: add C wrappers for ww_mutex inline
 functions
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20260103073554.34855-2-work@onurozkan.dev>
Date: Wed, 30 Sep 2026 17:24:44 -0300
Cc: rust-for-linux@vger.kernel.org,
 lossin@kernel.org,
 lyude@redhat.com,
 ojeda@kernel.org,
 alex.gaynor@gmail.com,
 boqun.feng@gmail.com,
 gary@garyguo.net,
 a.hindborg@kernel.org,
 aliceryhl@google.com,
 tmgross@umich.edu,
 dakr@kernel.org,
 peterz@infradead.org,
 mingo@redhat.com,
 will@kernel.org,
 longman@redhat.com,
 felipe_life@live.com,
 daniel@sedlak.dev,
 thomas.hellstrom@linux.intel.com,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <652B4E12-32DC-4797-A371-B0046ED5DB05@collabora.com>
References: <20260103073554.34855-1-work@onurozkan.dev>
 <20260103073554.34855-2-work@onurozkan.dev>
To: =?utf-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>
X-Mailer: Apple Mail (2.3901.100.1.1.11)
X-ZohoMailClient: External

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
