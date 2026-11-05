Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793904252;
	b=PdL0PrLFWFSel7OB+PF/UJiis7hKtdPPQ9sjXwVDWcmcBD7joMa4GpdkBfsqPBiFgdpY
	 lD1RQD0K/jQvxG46JCYO2gemWr7CFFMQPSiHSDt6ltEN4fbqdsrUcStwbTUDgZsUlq1mh
	 DW853cyjdsqM3jYu5djdqQCZDdQ4c1bHdzKJrLilGYeMvvXgUW+W0Q3Kz8uMjhV8R+xxF
	 q7Fz9cEH7x7XoD/iiV3wCQ1nQMeiaLgbaB19YLRrKuGM68a7Tw4Iq5A2lqoATAgw4xJxA
	 PiPzKuD2h7b56Wvp9PHpY75c67Yn60hvtBhOdYg8GvLeCzchEj6JyG+Bc1U7XA94Axg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793904252;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:X-Patch-Reply:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=yjEHK+ej2TuVOvshrMlh52d91ZptBZdtp0yfAjLYK6c=;
	b=pkyxWlm5fWUk12GK7gXGd9ZgOJQQEHkD0LlcXRkTTdXKBd2+giGcD47S7KWtm/lUvoik
	 w/RncbB8E79nL53xpCmkGgxEYrvLtjLuU4Uwk+vZB2dxFY2czi2XryJ++hULoW3o/TtB5
	 CikjXNtihXX/5IS+KPOBkv7ws9gY8kQlKSUEStUUI5Hm5H7kqLP+jM1X78dS0+9hnTaBn
	 2JQRIs9fMJ+3GCzY9akIdCu5QM8qdLNQUVjG7ijs4S/iPWiGdhDrg2rmp8FMQfqVJz/7G
	 LlmOhUUj9eoHfkc0wSqyXBwFKtF+p8sT2PaJy6NX0UPkkPxhS0aOq/C7m6hnUxrqt4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QwNdWXY8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0519606A326;
	Thu,  5 Nov 2026 18:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QwNdWXY8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 422281F00919;
	Thu,  5 Nov 2026 18:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793904251;
	bh=yjEHK+ej2TuVOvshrMlh52d91ZptBZdtp0yfAjLYK6c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=QwNdWXY8VWm7wVpZiJt0Z0YzVrf++pXDxMP12GCWlat3mGamkMPoNh8D+6++247UO
	 KiPc6quVExmZiRvVxqCbv9hKntw9pG8E5Doa1xV0FfMbqolWx60HBN8+0pQ0XYkugv
	 d3wUN0KEgoCamejJS4h0aW5EVE8zs+tW3UWHchrVJQnJ0gZZQAxLehgDyBQklArMlo
	 IZlk0Ld1/SRNfiBsfHlIy62F8vKZUYuiFCwSlo1JQkvXmFeIDPSjmWiVhzVhTRfTgT
	 lYBEx5q+tTTEZrITh3LRnHj3o7ew1uZVKgpRu2xZ4HrK2RMi3Cqctn0J5pdMxhUwWf
	 AhOo6/R1JwqcA==
From: Danilo Krummrich <dakr@kernel.org>
To: Philipp Stanner <phasta@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Gary Guo <gary@garyguo.net>,
	Alice Ryhl <aliceryhl@google.com>,
	Lyude Paul <lyude@redhat.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Miguel Ojeda <ojeda@kernel.org>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v4] rust: sync: Accept errors for Lock payload data
Date: Thu,  5 Nov 2026 19:44:05 +0100
Message-ID: <20261105184405.1118533-1-dakr@kernel.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261022160725.2215244-2-phasta@kernel.org>
References: <20261022160725.2215244-2-phasta@kernel.org>
X-Patch-Reply: applied
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Thu, 22 Oct 2026 18:07:26 +0200, Philipp Stanner wrote:
> [PATCH v4] rust: sync: Accept errors for Lock payload data

Applied, thanks!

  Branch: drm-rust-next
  Tree:   https://gitlab.freedesktop.org/drm/rust/kernel.git

[1/1] rust: sync: Accept errors for Lock payload data
      commit: 7a6bc132f1b5

The patch will appear in the next linux-next integration (typically within 24
hours on weekdays).

The patch is queued up for the upcoming merge window for the next major kernel
release.
