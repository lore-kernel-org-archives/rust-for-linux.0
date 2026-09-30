Received: from sender5-op-o11.zoho.com (sender5-op-o11.zoho.com [165.173.182.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80DBF4F7CDC;
	Wed, 30 Sep 2026 20:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.182.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790800071; cv=pass; b=h8T5gm9/uCpipmyQcjuxJSV8VO2fMcvDHzWBDXOXT+d2kd+52B3bam6a8Vv7JJ7gERoHof5k6KK9mwyplBiBaY3LILh1taAwDD2zBKuPoSWfo3O9gzhWOae6WBQDR1xpmcq6gF5KbRoLit4E6buSYC+Xmvb/t9vvi4SBAWHilQQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790800071; c=relaxed/simple;
	bh=aTrG2U3nnsahZNHEmxNMi33V9p9IP53O5HAC6ElbmRA=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=DoL1WmSigGZ6cIeC/b2IEfZl0V4FQiUV8PCsqpjizOfrLMe/ibYO7P1+9a4aNyUdD1nTTMzSF76sb21ZSpctFwqXxs8qoPvg16xzKEuFISimnC8D7AcOt9TQu7Fmajz5CEJeeOZ4NsbO1X8WRuuMS9gGNt5h2V55hSgLA4BRzFg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=Tuz+FG5y; arc=pass smtp.client-ip=165.173.182.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="Tuz+FG5y"
ARC-Seal: i=1; a=rsa-sha256; t=1790800040; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=jpFq37aX73cUFx6ENfPK9S3eE+UFBZC2fxkNWi+oI8XLU6tA8/L+dTf8DmL8ir/8xVR71y5Z6B1zryjh2BFVmWB4ZTjztfFKiiMDkxB9F2h+9EaZCLrWArjpY51yWvnp3weRpAwyNPa8UeeRC0bpALVs1RLJRBbm8BURWwbcZXw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1790800040; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=aTrG2U3nnsahZNHEmxNMi33V9p9IP53O5HAC6ElbmRA=; 
	b=RFmLp8EsoliLdSsMNhg4Dcwv4xad2trw31gLE8NuhYGN50MVYf2QyCmYoE5Jmq4Rz5s970Q6lad6tsX31rdNlf6J1MDMt/Rwt+BWE50dGKwR0P2hgZkry4HfBW86qkTheSpKcy7nvAOg+jV15SCjeizKVfbLIxD6D7jofQZW54I=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1790800040;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:To:To:Reply-To;
	bh=aTrG2U3nnsahZNHEmxNMi33V9p9IP53O5HAC6ElbmRA=;
	b=Tuz+FG5yRfpqlje+eC5t7buD6RDpBu/YIOt/fHTvP2ecmqFdjkjQcYqptG+KNaaD
	eYjuWbIDkVM7wBa3b/S+0UMNI6wNI3hC+cr7JHvVtMj2vkUS8WGMJC5D0w2CU3IePyg
	LoEcsUHaexQ7n5ty1QFnbAA4kvlOQJpw76s78ihE=
Received: by smtp.zohomail.com with SMTPS id 1790800038164271.96906449763003;
	Wed, 30 Sep 2026 13:27:18 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.100.1.1.11\))
Subject: Re: [PATCH v10 4/7] rust: implement Class for ww_class support
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20260103073554.34855-5-work@onurozkan.dev>
Date: Wed, 30 Sep 2026 17:27:03 -0300
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
Message-Id: <0F3652DF-FEA3-4ADF-A8E4-FAB6CEA22CB7@collabora.com>
References: <20260103073554.34855-1-work@onurozkan.dev>
 <20260103073554.34855-5-work@onurozkan.dev>
To: =?utf-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>
X-Mailer: Apple Mail (2.3901.100.1.1.11)
X-ZohoMailClient: External

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
