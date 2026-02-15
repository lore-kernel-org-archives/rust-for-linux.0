Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26EC217B506;
	Sun, 15 Feb 2026 20:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771186238; cv=none; b=GqR/Zi3HQEtnGqhhx4uWSRBAFACnSaeF+ZWmUvDwuL5Ri6cO/rqCHo1FKl96xfxUjJthWJN5NCDfQomhczDHnGMu5IUC7RTz5yc8BqKW9e3MYiwjPkzaUq0el7mM71NkgwLJ+nfvTKNbbRszFm1zajOa1tiQ2hCNcxgLBa7LgVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771186238; c=relaxed/simple;
	bh=TWoayj43Z1DoVodpwIIYhuva5gmv9cOsBiNiwKWh2Jg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Z9/011cQX/ofKoKwsvJIkHzkSaC1zJKFweR02qGagWw6BKBnp5qBUIQZBxBubeN0CcwArNOOildEPvTUKzbAYtwI0CPHgwoh1Mdwr03kos7UcGs4mb8+Ao9aK6/UKjsBLREh6jl/M20gr8rigc4wYuNiWT5yKmCdyCN+Me3utjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bXEalI9t; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bXEalI9t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70DF8C4CEF7;
	Sun, 15 Feb 2026 20:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771186237;
	bh=TWoayj43Z1DoVodpwIIYhuva5gmv9cOsBiNiwKWh2Jg=;
	h=From:Subject:Date:To:Cc:From;
	b=bXEalI9tx9XJdTelauTT3bbC2fcsGyWIDJHnX+R0t5HWikBQpId21qFSbMOcAV7dP
	 WpCGVwrHIRulZUHKcVtA5D7Sl3sq4fJ7CnkfDNDyyFXP32MYAgiph08ZPxbIjXNMSB
	 pQCgZmUU4aYZ/iHFlgLNgn+aZ1gecFqIOe5CKzCFUjn0GYJVdRJGg6A1jDCce9rg6C
	 LCLKNdTu8hxIdaVtWoU/XgRQ7hHMLl9WQ9/tteaQbrrwzcW0vYke+2xCUIF02W8VbD
	 NFROJECphNJITobZfbRtr7ZwmFwTBbbmJIIwD2ZkPPRzLJ1T3jNbxvJvsXHjXbU9ir
	 DK9h7dPWQXJhQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
Subject: [PATCH 0/2] rust: add a few helpers
Date: Sun, 15 Feb 2026 21:10:14 +0100
Message-Id: <20260215-cpu-helpers-v1-0-fab13d817a5e@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACYokmkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDI0NT3eSCUt2M1JyC1KJiXQOL1LQkI1NzIxMLcyWgjoKi1LTMCrBp0bG
 1tQDmTCgIXQAAAA==
X-Change-ID: 20260215-cpu-helpers-08efb2572487
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=665; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=TWoayj43Z1DoVodpwIIYhuva5gmv9cOsBiNiwKWh2Jg=;
 b=owEBbQKS/ZANAwAKAeG4Gj55KGN3AcsmYgBpkigpDYVTOVNnYEUMEG5Mpnl9NfvMAS0LlyPen
 jb8mOq0M4iJAjMEAAEKAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCaZIoKQAKCRDhuBo+eShj
 d3fWEADD+ILurKUR/0Xh5+6IHuPSF1XsEAv8k0oBAFSFkFh7SnBzRii0oalUsz26ZpIaFbxdB95
 Vz9YmdV4SYcq5jSC3w3PhGbYGYZTGLAkMqFOoAHmVX8SHgnyrGA5+gKwNUr6vUhfv3wK8kGyAw9
 oRWxDlVZ7xGxFyQeaevZwOlTs1R9r4dCY+T1D2eSsoEld3iIWHzQKFx+uODWqHJIm5NgQB3pSIB
 rDQDu5cEz/hbmHCG4RfXD29/mw+DdOciYXdcEZ2eslrNGhbHCA2QQ/11sAgBXw/qYfP0XWm7GTC
 jpD72Rk/v7B+MIJW8kPtb1FkIfLWwCh+NDSvwpbFqTsEr8oE+pXw1iUZrUpqQ7xGt9zu480SvLi
 Po+DdjMgTMj2r1MhhV25IwVDmwYuQVwvULgqJ+YhjXrJKqfza9XZr/Z6EBzA2bayEZllhSu+jYI
 fGXwGei7N8AOmHJWTh1ag/oNLIfjz7utgmNFT5JChec2LJZe6LN3sCXLHT6rz53pkTco1TtFYe+
 OZDp/wcjgTGE87f1kKHQfD0ctr/715jP9XQzXLfc7A9fg4/KHzWs466shxmAHWtM9sTqJCmF1Fx
 E4FgDPV3PfVQQF07yRmD2ofTaP+FqqxLWGX/UZj9XAMbzEpiUmV4F6dmAr74nxEfERU5EZet1HL
 zi9OBugOlksuBow==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

This series adds two helpers for obtaining information about the number
of numa domans and cpu count of the system.

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
Andreas Hindborg (2):
      rust: add a wrapper for the `num_possible_cpus` C function
      rust: add a wrapper for the `nr_online_nodes` C function

 rust/helpers/helpers.c  |  1 +
 rust/helpers/num_cpus.c |  8 ++++++++
 rust/kernel/lib.rs      | 17 +++++++++++++++++
 3 files changed, 26 insertions(+)
---
base-commit: 05f7e89ab9731565d8a62e3b5d1ec206485eeb0b
change-id: 20260215-cpu-helpers-08efb2572487

Best regards,
-- 
Andreas Hindborg <a.hindborg@kernel.org>


