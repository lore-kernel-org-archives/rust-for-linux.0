Received: from sender5-op-o11.zoho.com (sender5-op-o11.zoho.com [165.173.182.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C89CE261B8D;
	Thu, 27 Aug 2026 01:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.182.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787793359; cv=pass; b=kk7ceWMR6PxKBRqeN8vJQNW6elVW6ESMAH1M4fKEtHIXzfLxj+NaTkq94D3W3sXE2/VfOrF6+srVvz3238Jlm+nBqOEkjA6Lf7ZjWEwrnWt8CdMMtUZ3tLV/v9yVl0mVnuDA7fK3+1LZrrxC2UfhGnEKDH009e8hPoXOoquXCyQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787793359; c=relaxed/simple;
	bh=2HyyO0sKCns4B5zSRKhaTfhM93hYk7HmIjn/I3F/Aps=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=jAGSk2amuuNQasRUewkkeCSox9RDQ7TiglF+7XZkNpjpSq8l/dXx/b5PGnYTPLK0CJFZnojjahXhr1lF6FP3SXK8UPCR6j8TJAh/rpCDUUCc3AX27zWFlLGu2PUZxyM5kNZ0bzu5ohuzxVj/ZfzPezqKvzerDVLgdFg29MZXVXk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=SZxuyygq; arc=pass smtp.client-ip=165.173.182.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="SZxuyygq"
ARC-Seal: i=1; a=rsa-sha256; t=1787793318; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=fKdwSOAUoLaixMqmZrWrRHFKQ7HX1xX/JE3X1k5U7zKgj49aztZP5Jco3uApED/bsc4Dsd/oIY9rWjp2uHi08UXPeqH0j7wRMHmELViQ1x+iOiuhCphXPWtLOMfwE8gNk2+5R488DHg+1nRco9CobimtLaNul6xnRXgm9dJZv8g=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1787793318; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=vzFV4YTSoIcUz/ANNnzBojGs8mxChDWT8nd+V0Zczo4=; 
	b=JS++cG25r2E+wjyyouXRCyKaiQLx+J47y7xeh8jJNKW6XhbYn1CEpzRfEn2IZbZi4QYKJP7Ssn+Ppc27SDXkpUgjIvTkHiSyztl7io++J20wzkvTCtqEj8UxmH/UjzDzKde7Y5xiE/KKuIXbWvdScaSMIpY18KFGqpYmOuz50tI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1787793318;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:To:To:Reply-To;
	bh=vzFV4YTSoIcUz/ANNnzBojGs8mxChDWT8nd+V0Zczo4=;
	b=SZxuyygqh793azRppG8fjZ0fz4hiSQEiLf46mjV5aZrWjT8l/0H0oiTUngyK+Evq
	Regx3dICNEyO+pPp91hwkc0+F55lQdk8kCDxJ000aeBxl8FrSylYSVCtShV4hM8U9ZM
	x0R3QTHFr1zk6bzubgRXAHX66r8+EHb5NSSHofZs=
Received: by mx.zohomail.com with SMTPS id 1787793316273765.8792330306574;
	Wed, 26 Aug 2026 18:15:16 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v4 06/11] rust: xarray: add `find_next` and
 `find_next_mut`
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20260604-xarray-entry-send-v4-6-965f6028790e@kernel.org>
Date: Wed, 26 Aug 2026 22:14:56 -0300
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
Message-Id: <BEA4B094-7587-45C8-801C-A6F49E574EA6@collabora.com>
References: <20260604-xarray-entry-send-v4-0-965f6028790e@kernel.org>
 <20260604-xarray-entry-send-v4-6-965f6028790e@kernel.org>
To: Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External

Hi Andreas,

I wonder if we can't hoist most of these calls accessing =
self.state.state to
the XArrayState directly? For example, I see this in a couple of places:

+            bindings::xas_result(
+                &mut self.state.state,
+                bindings::xa_zero_to_null(bindings::xas_store(
+                    &mut self.state.state,
+                    core::ptr::null_mut(),
+                )),
+            )


How about XArrayState::replace(new: *mut c_void) -> *mut c_void?

Also:

+                state.state.xa_node =3D bindings::XAS_RESTART as *mut =
bindings::xa_node;
+                state.state.xa_index =3D 0;

Could be e.g.: "restart_at(index)=E2=80=9D.


WDYT?

=E2=80=94 Daniel=
