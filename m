Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.36
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795382544;
	b=vKVwHjm8cFx6jLljBDIsxnMEH5vpih04FQYvnalHesBlTmnCrxZk9T0dDyyZzhPBvUQB
	 qV6BOWsHGYaGwQJRYIKWaGBD69DLgbizQA/UQJD/+p0/dsDUa4STNXOrbPRuY566HWusn
	 +Ugo8wTu3Oc3AJYxYEwp+EOfgZocPjTI+Emeasz3eh46Y5GAo+2OdAA7/t6glTtPu7eQU
	 JS/+SjQr3zJ9pfM0a/KFeXBMaHWlc/aIG//EvFpSo82CXcjRFNNd0CoKBEhrLFMRqImAM
	 454/XUmGf5DUfimBp6Twrls1pmThn3foAjOn4UG0+XUN/YIw538tcJyUTzIzV7B8sDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795382544;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 MIME-Version;
	bh=4fufsDQ1xvC3zbg+yGa1jsAS5bqwuf7ZledZ5/n7XQo=;
	b=5SUx2ohMroiUjmkaCr97h83U/WKwC3zE/mbC/nrXTQ1MYhmfb7yku7Zk7TeCJjre90r7
	 OQ+TSQB7KQd6en0PH/qyu3F8mtjo4YjBVBvJtfuNKi2qJhHZlmcfrqPBYjZ77iYmePRdn
	 sJ7IVVJ6lHT5hSfI0ugI/sywUk5Te7UsYhepk7AfZZ+p7P3AhgwsjsWbNIPWhKFyqbGZ3
	 FVsEYsz3atBq4F5lZ9N2GRQoyr9q9axaEcVMFOMUpYumjSksMLRrnDqbdZ/mQ7VO31IVq
	 Kj8iOpEUkrnTOSly4tewqvuTDe2FJV5JxUFWAmW092HOYyvgiXU6lSzUFL+3FI9eG0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	arc=none smtp.remote-ip=95.215.58.36
Received: from mta1.migadu.com (out-36.mta1.migadu.com [95.215.58.36])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67693606A31D
	for <rust-for-linux@vger.kernel.org>; Sun, 22 Nov 2026 21:22:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67693606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Envelope-To: rust-for-linux@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=4fufsDQ1xvC3zbg+yGa1jsAS5bqwuf7ZledZ5/n7XQo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795382536; v=1; x=1795987336;
 b=JVJPIi0EDwWXRiH/d2wzluigPGkV5m4LZO+SNnp7wUmcsRtzN71WUg7z+jL6vrjaVv24MJOd
 IDxeYaySdblhDH6wrScbqyy5OJfJ4UmC1jEEqXxB1iusR+lMvpRnFAZmnTaecsgMQBL6QNim3F9
 rayvxA4Y0x2gUBUrCRFnH6lk=
X-Envelope-To: rust-for-linux@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 71d8f717f0abf706;
	Sun, 22 Nov 2026 21:22:16 +0000
X-Mizu-Trace-ID: 71d8f717f0abf706
X-Migadu-Flow: FLOW_OUT
From: Igor Korotin <igor.korotin@linux.dev>
To: Muchamad Coirul Anwar <muchamadcoirulanwar@gmail.com>,
 Jonathan Cameron <jic23@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>, Alice Ryhl <aliceryhl@google.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Mark Brown <broonie@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Shuai Liu <847807867@qq.com>, linux-iio@vger.kernel.org,
 linux-i2c@vger.kernel.org, rust-for-linux@vger.kernel.org,
 driver-core@lists.linux.dev, linux-kernel@vger.kernel.org
Subject:
 Re: [RFC PATCH v7 2/4] i2c: rust: implement SMBus access via IoBackend
Date: Sun, 22 Nov 2026 21:22:14 +0000
Message-ID: <179538253428.9669.5532258807115715261@linux.dev>
In-Reply-To: <20261109155743.83740-3-muchamadcoirulanwar@gmail.com>
References: <20261109155743.83740-1-muchamadcoirulanwar@gmail.com>
 <20261109155743.83740-3-muchamadcoirulanwar@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Reviewed-by: Igor Korotin <igor.korotin@linux.dev>

Igor
