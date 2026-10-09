Received: from sender5-op-o11.zoho.com (sender5-op-o11.zoho.com [165.173.182.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5A0135C6A8
	for <rust-for-linux@vger.kernel.org>; Fri,  9 Oct 2026 14:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.182.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791555865; cv=pass; b=SRAEny+w5jWfcDUq3SBRYAeYHq9wRScUmLC9Gymbqiaqtb+kLozgYzDNEE3TXjzDIJHEfSj/ddPvTH15Zdk5bL+LzYWpmzE+U3SJHjS0zlcl3fryzwJNbEuV9Ehay9S0T6qrkoiU7pmX8fNbA5xypQuoPQ7/5kgwPgiz0I0HnfM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791555865; c=relaxed/simple;
	bh=rZbHmDw7k1JuGcWfTDK449kSL5IH3c8JdJckWZ9HH+4=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=GaMMmvB3aIO/JHPQh2qO2d9S9rIuNw58TyqdUXxTD0es3Ca5DUPzbLA2zgJoK+O7+4hkEYwAKtK7PMoFFq4u7QunLhK3lG3ITZ7BJtez1vSp0HOyG/Y+mamODP160AlI3P5xTeN14YZmAWrx1LXTL0U2FltC837ByyMdWmVGLso=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=RksHnFXU; arc=pass smtp.client-ip=165.173.182.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="RksHnFXU"
ARC-Seal: i=1; a=rsa-sha256; t=1791555795; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=lAlURLZu0gsFAeLRiD3z03sBeXmic9SGbshdeCgMaFoUMt0T8944Sg4G8+fJeVQ2fSSKUoST3hJtrF9JaYE/z1A2dzNKQ6LkQmiKM1JKkQn5Yqa79C74hElIgHkgfXcutoGE8tzx1ZDuF5wJdl5LpTT4URlDveQccaWZmc4cVbk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1791555795; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=rZbHmDw7k1JuGcWfTDK449kSL5IH3c8JdJckWZ9HH+4=; 
	b=AyNf1Benc97uLhNZOadBHnrPfdI9qQEtZTBBq/s5SFaqdcCeaUzjO8jNZpLdvTlqFbt9vCPbGydG+rTlU9aZ+YIar8GaXB71wVnwjlnNbuHZ7b1v/RzOp7+1wBRD7AUmg4mI0zH0xdeB3K8rLypoe93rBRAa0eXU79gXVIezrmQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1791555795;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:To:To:Reply-To;
	bh=rZbHmDw7k1JuGcWfTDK449kSL5IH3c8JdJckWZ9HH+4=;
	b=RksHnFXUcBOTHXDLrx+PEsxDe3TSlE182Y7go8RfuwdnkyFUYVG7jmGVUmhy/InS
	33+RwaGKOema756oga6ZpC9trR5D8n7q3GnEPq6bqaIs198mef/+pJ5ruZO0nQ6RXz4
	SI3PYNsTn8VbtlMEzJRagi+BUdjHu8WpzNpIT7pI=
Received: by smtp.zohomail.com with SMTPS id 1791555794216331.23684005909104;
	Fri, 9 Oct 2026 07:23:14 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.100.1.1.11\))
Subject: Re: [PATCH v3 04/11] drm/tyr: add per-file VM pool
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20260929-tyr-ioctls-v3-4-26955fb111d5@kylinos.cn>
Date: Fri, 9 Oct 2026 11:22:54 -0300
Cc: Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 Tamir Duberstein <tamird@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>,
 =?utf-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>,
 Lyude Paul <lyude@redhat.com>,
 David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Sami Tolvanen <samitolvanen@google.com>,
 rust-for-linux@vger.kernel.org,
 linux-mm@kvack.org,
 dri-devel@lists.freedesktop.org,
 driver-core@lists.linux.dev,
 Alvin Sun <alvin.sun@linux.dev>
Content-Transfer-Encoding: 7bit
Message-Id: <B980B946-8AD5-48DD-95E2-8EFAF3F353FD@collabora.com>
References: <20260929-tyr-ioctls-v3-0-26955fb111d5@kylinos.cn>
 <20260929-tyr-ioctls-v3-4-26955fb111d5@kylinos.cn>
To: sunke@kylinos.cn
X-Mailer: Apple Mail (2.3901.100.1.1.11)
X-ZohoMailClient: External

Hi Alvin, thanks a lot for working on this!

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
