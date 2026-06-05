Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ABBE426698;
	Fri,  5 Jun 2026 15:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780672542; cv=none; b=CZ8Kzwuo0IgLlFpYGg8g/cgnlZgCoKWJiA9v3lINtBMKDQc21e9Ke8tXhaDEE+AG+6W2vFXGiZlAsHDLsXY8CrGrQKnrUGR/6l3U9HIRWdReX9NRt6B3tzOSFBcSTvPo3mtP5UlUq2h7JvIVMG+PvILtcToLmjxl2onqXm6LwgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780672542; c=relaxed/simple;
	bh=4Gas6D2Ieqxv+wUNf8Y+VGE9tCZEU+wVvtnj47a3isI=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=Ivp5tF0XmvnPC2We1S+GBX+kRJMbxmDQwedM6TtbG1p/AzOmXVEt9XhLr31cjH4Og0ygcalH28qEZn5OViSTVXW4+Nv4gTRiCVgKRNWt9WfckxV+MSeTfVfonjbdm4sPKTs1Msm7AymQ3hNsUYF0TQbf2yPAyeqt0Uyf29GyeRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OC2UtzHD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OC2UtzHD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC0CA1F0089A;
	Fri,  5 Jun 2026 15:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780672541;
	bh=75Qlg4fk3oODyHBzCwgS9w0a+hSPmlXa3ywbw1l5d/o=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=OC2UtzHDzAUOKyaiu6ce4D2hjONJyP8OAgQ6RtM83JvvrcFaq3duFsvzW/gQvS/3z
	 yttvgRI74u8uHD9qAPteT/9Shyqyai76W6VQgZnqwS1r4VJGyOLXokOL1dI83rDsi+
	 Ug/jfMH9F08bcQu+TERrmP5YmCoMrPq35f6nogk8fgBRKrM31n2oNpOXO1VwPSJ+ML
	 goiLBHjnGHH3BwVX+dPQTv/8aReQbdKgzJjJqAV+MNaYpm6kN1IlW0vMSnmOOJoXte
	 wGKH0H3qTqb6c2qDiDQhTUEpK4hMlVTh20hA/wORccCdWa/iv06LvrIJeWg9X1DWFL
	 7vhknbVj43Ceg==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v4 06/11] rust: xarray: add `find_next` and
 `find_next_mut`
From: Tamir Duberstein <tamird@kernel.org>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Christoph Lameter <cl@gentwo.org>, David Rientjes <rientjes@google.com>, 
 Roman Gushchin <roman.gushchin@linux.dev>, 
 Tamir Duberstein <tamird@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
 Vlastimil Babka <vbabka@kernel.org>, Harry Yoo <harry@kernel.org>, 
 Hao Li <hao.li@linux.dev>, Daniel Gomez <da.gomez@kernel.org>, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mm@kvack.org
In-Reply-To: <20260604-xarray-entry-send-v4-6-965f6028790e@kernel.org>
References: <20260604-xarray-entry-send-v4-0-965f6028790e@kernel.org>
 <20260604-xarray-entry-send-v4-6-965f6028790e@kernel.org>
Date: Fri, 05 Jun 2026 11:15:13 -0400
Message-Id: <178067251353.96312.9527123475656114033.b4-review@b4>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=739; i=tamird@kernel.org;
 h=from:subject:message-id; bh=4Gas6D2Ieqxv+wUNf8Y+VGE9tCZEU+wVvtnj47a3isI=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDFlKL4SUZrq4d2zbfUSo35u9T3zbtc8y1+f+eGIrqfNh/
 aacL5FGHRNZGMS4GCzFFFkSRQ/tTU+9vUc2891xmDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 0EjHQMeYgYtTAKb6exwjw5sblYxX9swJDdOqZbQMjz4/xV7pR6Pqtk2aDM9eM/VwuDAy7DD7KGN
 U+aEoQae0lfF4vGqd2JFtIvw1ltMtmIWOPNjGDgA=
X-Developer-Key: i=tamird@kernel.org; a=openpgp;
 fpr=5A6714204D41EC844C50273C19D6FF6092365380

On Thu, 04 Jun 2026 21:58:12 +0200, Andreas Hindborg <a.hindborg@kernel.org> wrote:
> Add methods to find the next element in an XArray starting from a
> given index. The methods return a tuple containing the index where the
> element was found and a reference to the element.
> 
> The implementation uses the XArray state API via `xas_find` to avoid taking
> the rcu lock as an exclusive lock is already held by `Guard`.

The previous patch re-hosts existing XArray methods on XArrayState, but
this patch and subsequent ones are choosing to grow the XArray API
rather than promote XArrayState to a proper abstraction that users
should prefer. Are you sure that's the right choice?

-- 
Tamir Duberstein <tamird@kernel.org>
