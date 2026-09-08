Received: from out162-62-58-211.mail.qq.com (out162-62-58-211.mail.qq.com [162.62.58.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FC2625B08F;
	Tue,  8 Sep 2026 09:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.58.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788859597; cv=none; b=M16b1NCs30bkWrB85E03N15aHAzzWPx+UjL53w06aj2yDosp38B96sCwyEeaAkikDvsble0MT31SV5/bv6i5IR7njn0ARldXjzMAVTXgIf93qQ1Jixs3f+qyFsL4mWqtoLY3oQCC4IFVakfAc0R3ME8syx3p8cbewXmPdHcsHUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788859597; c=relaxed/simple;
	bh=NVDE2sLQ4M13/fLqGyj0CojUDayUMwa1vGbUCOkpxE8=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=pO3hW//gxixE4U1cSVRQsaDD56bCzSLdM9opm772HFynsPXa3wevKUhvUrTAFssGcaC8AEb/FhkdMsrW1mufkTGiMWzaipiB8BscAVC8ouGcmR4UfgfYMY/uKeJelVDgEEl/S9rgAD0gmh+W2wJGDb3NLHzcUVGcbFPFotA1Xik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=WyeITCVj; arc=none smtp.client-ip=162.62.58.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="WyeITCVj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1788859589; bh=VUWpumI6tH3yHTvLma2YBoGq7bQ7eQcYJZEP8zAuh54=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=WyeITCVjRHh3e+gg44X5+hE0R8aCjX6/QoXZnUQn5XZ/h1Y4ln5TcyoNZnrVFzwoz
	 c10FhW3BCSA2dntHwQUjKTq6TZFpDXC+sooyqEe4p0Oo2VC+tDgfpOCVMoyw216YLl
	 gKABJoZcp+/OMxb7TOLO4BYm31M0rZKALzKyzun0=
Received: from localhost.localdomain ([240e:342:b241:2200:5415:9e:37cf:c860])
	by newxmesmtplogicsvrszc56-0.qq.com (NewEsmtp) with SMTP
	id 6999861F; Tue, 08 Sep 2026 17:26:25 +0800
X-QQ-mid: xmsmtpt1788859585txyzkdv6z
Message-ID: <tencent_1D199D902D0238FCF62DF8ED4FEDA3FDBA05@qq.com>
X-QQ-XMAILINFO: OKkKo7I1HxIePrT1VHd6Pp1I7ERq7+J5AqqdveMi9KxJMlfwhbAI/ffC0EjlxO
	 uloXKLYR9j34BUpZRro8hMZHllXx8b3fJuSfIHuKiYmDjqJ4vy69GaEAF2keq+Nj+obj8RgRw7oV
	 Soxj2YoOtbcYqd1MbBRlwYSkJsDAc4Sf5T2eYDyNdoQsSJ9InyQFokiNsINryV4yMxEcsI6pdGlI
	 3yhKjrTLWOV3KZktIzgvI+HKKpexQ4rxGTpAGl2V9u9zORfV+H4bacNONCOllUPrCKOmuC1yn2Sh
	 odMD7KTRnrWLWQSeEGEayiMNrft2xwvUPmxNhM5hSBW/WpAyKGREAG/MDI/AbmEV7FWZj3hEenjB
	 4A06gEhypEQ+yHMxQesVIPjQY8VFfFYPZVmGtdXth9a7W6ZbNqFhHNU7AbaVz3ZGQbUFaTKNSrkV
	 o24z4rM44Z+PyWwd7OxAk3P3eNj2bs029rq/bLdr30snAWkD4tJzuvptKh5XHlLqlopgG4Lohllr
	 cLFLZZPpZggz5Us+2o8H4BjsfQ6yiiAMLe86xEmXBEe2EmDMmLRe9jTupNcuxyPdO6fV9JReIpOz
	 TkKLZID+SLGP/8M7D16FJb6lcVACqBtSw54mBpaz/yneRrJJjDN6ogjIBZcC+enwHmF66E4ADM7G
	 uHL0kXrwYecSuUhIZgFu3F+pZMFW0Mnwe3vzu0ZoqDg/IxCjehOS0NBhLG78vknrfXxeyqT4s9Sb
	 ktGCwjt70zJQsl3odsCyRr8i3G2Okx0k017nnqZ4DPHD6dsZvIMvLFmDgpogElU635c9QVHUJ3Fm
	 +jDjQLxGUWgi7DAbF2jPBo29A40TCzaqQXsz8VWv70LD1iHMZoT9ADeiocy+z4CfLn5wVauEHHyN
	 cTOxS5WWg+W7dJtneFnGR7H40R6tn8h3KVqnsxSZD3l91q+nsEQwCc0jf/RY0fstb9MYQiV8NbeD
	 5wmO7RMyONmHlcVGxB0IzGuEXEVcs1rt9Oyzs9r7Y+H4qd35EzX9b9X0WKm3wsREJADb3WRmHxtN
	 bbjJlEOGCRYeLyEhQwH0NMioHGVOB8HJnX+8jecZny1hqH+GpeSqe0Dw0c0+9M64ZwSJSjoa/kqQ
	 vMcWSZ
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
From: JX <1239989762@qq.com>
To: Miguel Ojeda <ojeda@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>
Cc: Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] rust: add unsafe precondition assertions to Vec length helpers
Date: Tue,  8 Sep 2026 17:26:22 +0800
X-OQ-MSGID: <20260908092624.63350-1-1239989762@qq.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260908080604.34070-1-1239989762@qq.com>
References: <20260908080604.34070-1-1239989762@qq.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The safety requirements of `Vec::inc_len` and `Vec::dec_len` are
currently checked with `debug_assert!`. Convert them to
`unsafe_precondition_assert!` so violations are reported consistently
with other unsafe precondition failures.

The first patch makes the no-message form of
`unsafe_precondition_assert!` usable from const functions. This is
needed by `Vec::inc_len`, which is const, and avoids runtime formatting.

The second patch converts both Vec length helpers.

The series has been checked with:

  make rustfmtcheck
  make CLIPPY=1 rust/kernel.o
  make rusttest
  make rustdoc

Changes in v2:
- Use a fixed diagnostic literal instead of concatenating the stringified
  condition into a format string, since conditions may contain braces.
- Add a const-context documentation example with a block expression.

Link: https://lore.kernel.org/r/20260908080604.34070-1-1239989762@qq.com

JX (2):
  rust: make unsafe_precondition_assert! const compatible
  rust: alloc: use unsafe_precondition_assert! in Vec length helpers

 rust/kernel/alloc/kvec.rs |  7 ++++---
 rust/kernel/safety.rs     | 11 ++++++++++-
 2 files changed, 14 insertions(+), 4 deletions(-)


base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
-- 
2.54.0

