Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBDC54DD6F0;
	Fri,  5 Jun 2026 12:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780664153; cv=none; b=e3uNwhpKr/ToWPflcFx6hpI+n6QkhJG1toyALvQI13NMFijTwCw2ueiulhCMuqY731i5zewm7KQNu+HKtGktnavKsKENY52mnNYmedCGAFtKRN9eaxp7P9+nAFZk2YDFOQ+O2hqPakgbEiDGxhVQocRVGD8EKCfRH3wBeVvVTSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780664153; c=relaxed/simple;
	bh=rK/+lX0uk8h+ak3+JMTSuA8HF+1aWEtBmDd9ks+hSDY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=CwhrE9fDIEXBSAvqgn8vqdUFzq2wY2CCfiU4TA5xvPTjpjSmGfaS473y5SSUKaiIYdXmQE1knLVZcljqRjb9Mx41X2pJxnB1su0q/nGtz6h9hMu0sdK8+7eEHWgpc2k/0/jTwkohU46HM12K48QVS0CGEnfXKFGIZnqlIe1nUDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M9knHdBh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M9knHdBh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F2B41F00899;
	Fri,  5 Jun 2026 12:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780664151;
	bh=i4grzi6dZmCEfiEcDKPt6PAyWeMhy+WtfbYW6U1z07A=;
	h=From:Subject:Date:To:Cc;
	b=M9knHdBh1gIiM5oiEpqIKmrJEbse+ZN3UYnUAP8YRJuFYZ3CkxZwnaprxxcxHwXjo
	 fjssiy0gYzpsanA1yNhKUKs/MbSrK6ajaA1O/lHuRuccLQdN206dU21DUTpwfT3+Jz
	 XH82vUntQbi1SlB7aE4GAtF0H0UYcz2EWQK3IBzlOKgi7hivPBC8joVWvS5AvwqAQi
	 Nel5l1sD9Xo/3rxsy4fyCV2Uhzmd09lrfS2n6/b/K7Nu9Hub3B6ZWIOCaO7llJd2tp
	 tuPBIdJYX9k0QG+98c+nWA/zbG9ZSh9c3A42hNHphwYeeHfnZxrVmnGHyNc+Hn9A5M
	 tn7Op6XOmtEIw==
From: Andreas Hindborg <a.hindborg@kernel.org>
Subject: [PATCH v2 0/2] rust: add a few helpers
Date: Fri, 05 Jun 2026 14:54:55 +0200
Message-Id: <20260605-cpu-helpers-v2-0-0ad227f0d91b@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAB/HImoC/23MQQ7CIBCF4as0sxYDKEJceQ/TBW2HQmwoGZRoG
 u4udu3yf8n7NshIATNcuw0IS8hhjS3koYPR2zgjC1NrkFxeuBSKjenFPC4JKTNu0A1SaXk2Gto
 jEbrw3rV739qH/Fzps+NF/Nb/ThGMM2cHcZqM0Fbh7YEUcTmuNENfa/0CvEOLQqcAAAA=
X-Change-ID: 20260215-cpu-helpers-08efb2572487
To: Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, Boqun Feng <boqun@kernel.org>
Cc: Dirk Behme <dirk.behme@de.bosch.com>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1636; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=rK/+lX0uk8h+ak3+JMTSuA8HF+1aWEtBmDd9ks+hSDY=;
 b=owEBbQKS/ZANAwAKAfpQKQiqxb3QAcsmYgBqIsch0W+flcUDzyv3oE1xmral7IGWTUx3Vs7qc
 fcBAXEeTt+JAjMEAAEKAB0WIQRXitnI2WZ2JirAaob6UCkIqsW90AUCaiLHIQAKCRD6UCkIqsW9
 0JYrD/wLPWezyNeSvQ5MOS4v/pnm25RuvIaI6nmmyLR3SMwDl7CDR6vnLwEHMK5WAeH3S4SBd3A
 rJfxc5u6N7AVme9d6HSuSuwk81OPvrtkCs/A8Rj/nnlB2OBc2oJdTMw/fmguV8UgFtNmg4Ggirh
 BrR4rJQLU5G0W1S7c/e4ePujamn0P+9Ouc3xeg/X0jVA/dqxL8KDLJvPobpHhIp2eeaaaZTt4ws
 p6oH7m2dpDKUkM2s/+Pr+xK760Kx9nce2XSzmUmYXBhDq+lF6JIoj7kqm3Pp12Lt/1vtm+MgjE9
 /ZrBmjGej3Wua0c4AJEnKE6Z5TmNeOrWgpAeZLJvEoxG78CH2mo3JySDiXMTsG6NBYvp62uspHU
 Kt1oriWD0uJCy9Y72qzmJSR72pe3G0yRyeOx0L6L2KKrWtG26UCijXvbRJ+k7FuyrM+XNGmn7rz
 Cd2owoo+VFm11n4K+VR8IYO8P2A6JAKos4ncL++tq0mu1Z1B9jDVsbgiuT9FSW7mo7pcBRQDuUU
 0S5mNbDOzVLALbmwOj237ClRSgGw5bRW3kCE3UHdbDZAFZUdlRZQa2PPVaIHCvTMRa3TbgH8rDj
 1RU48UNvnpraIPDrv/VepCUHCxj557FRSKXyZVSz2RRWjEcwt7KBgekC3fLA/I+lIpQuWMeTCvf
 MQCrmaYm6Nf+XjQ==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

This series adds two helpers for obtaining information about the number
of numa domains and cpu count of the system.

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
Changes in v2:
- Move helpers out of the crate root into the `cpu` and `numa`
  modules (Miguel).
- Mark Rust wrappers `#[inline]` (Alice).
- Mark the `num_possible_cpus` C helper `__rust_helper` (Dirk).
- Mention the Rust null block driver as the consumer in commit
  messages (Miguel).
- Link to v1: https://msgid.link/20260215-cpu-helpers-v1-0-fab13d817a5e@kernel.org

To: Miguel Ojeda <ojeda@kernel.org>
To: Boqun Feng <boqun@kernel.org>
To: Gary Guo <gary@garyguo.net>
To: Björn Roy Baron <bjorn3_gh@protonmail.com>
To: Benno Lossin <lossin@kernel.org>
To: Andreas Hindborg <a.hindborg@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>
To: Trevor Gross <tmgross@umich.edu>
To: Danilo Krummrich <dakr@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: linux-kernel@vger.kernel.org
Cc: rust-for-linux@vger.kernel.org

---
Andreas Hindborg (2):
      rust: add a wrapper for the `num_possible_cpus` C function
      rust: add a wrapper for the `nr_online_nodes` C function

 rust/helpers/helpers.c  |  1 +
 rust/helpers/num_cpus.c |  8 ++++++++
 rust/kernel/cpu.rs      |  7 +++++++
 rust/kernel/lib.rs      |  1 +
 rust/kernel/numa.rs     | 19 +++++++++++++++++++
 5 files changed, 36 insertions(+)
---
base-commit: 7fd2df204f342fc17d1a0bfcd474b24232fb0f32
change-id: 20260215-cpu-helpers-08efb2572487

Best regards,
--  
Andreas Hindborg <a.hindborg@kernel.org>


