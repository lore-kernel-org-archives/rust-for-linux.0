Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFD1847F2F6;
	Wed,  3 Jun 2026 14:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780496840; cv=none; b=QzUS9pXiIa5zETHKU487Sl4Z1XbrIRXTbS1xYRiS8s9aIKTBBYH0rXtciKHbPsQWN+7fY/QrxHE2FGApuwIxErfD36BYCRbrbwYJM7EJMMtKfcT0yAOYfc5sNkGZtUwCNPni3TA3+Qe8SCwWCaibiZ38YEdCU0r9wHl3b9pohjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780496840; c=relaxed/simple;
	bh=yPxuJfzzvy+sKkOVzhOIv7i9u7l/7dH2j38QtqiQcf0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=NTEXvB/fCtb296p1iL3f63NZJEPREf0eTOiowYO5kdfJauP+LDyxVcQcsCJv0KdwUKHmBHNJgyKo9yEMRAuStEQdzOBenVXNJGj0yX2YJOwASM978qkXps3sa/FlKXlLjlUrswr1oHIePXrYQqH1EITk9gSfgWOdeExCq7UTqtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mxw0vqtb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mxw0vqtb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 405501F00893;
	Wed,  3 Jun 2026 14:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780496839;
	bh=TKeh+M4fxZv9dKqRVQfi+Sekl/CUVVEhdVrSPTcqBqE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Mxw0vqtbHxgjvzISwQIhVvXJIJsCj1d0Y9lAC7KdYYnNn5BT6BzYWz/IMVSJ0h+J7
	 /x216Dlr94jZsxvmR7M6ZI3lpaU898TJtY1jBLSZdC3tQ1PK3dGdR4eI5TZVbPoobf
	 zei55EWgoFBgZREhYbZtGZ9q+YUifkr/Oar4p8XgOEkQy9U2dg0iyWC7SA/xbbGIUu
	 Td11YqEiHms5WIamIWtn2lEOHqlybcBu3nSEcvBsEnl1OJ0v95Rse3E8F5XRp1xQ5T
	 X1yQMzh35XWGv/Ztstc4qU6pcqhfNmFR9pj3G38ALTH2asyT9cuaMLqLEjwoFag7k6
	 0ycLj4qnxSQWg==
From: Tamir Duberstein <tamird@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, Jesung Yang <y.j3ms.n@gmail.com>, 
 David Gow <david@davidgow.net>, Malte Wechter <maltewechter@gmail.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260603-rust-analyzer-macro-v3-1-9f7fdb4908e5@gmail.com>
References: <20260603-rust-analyzer-macro-v3-1-9f7fdb4908e5@gmail.com>
Subject: Re: [PATCH v3] rust-analyzer: update generate_rust_analyzer to
 pass cfg to macros crate
Message-Id: <178049683176.82063.16666929497443909361.b4-ty@b4>
Date: Wed, 03 Jun 2026 10:27:11 -0400
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=352; i=tamird@kernel.org;
 h=from:subject:message-id; bh=PuzLcZ8s7HCYSIk4Ux3LeB/E4yD+tVDFrjfoQMPBJz8=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDFkKlsfW1wW9sp/RvWz6geLMLxJH1rW8alNRiQ362WL4+
 +y3hAnSHRNZGMS4GCzFFFkSRQ/tTU+9vUc2891xmDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 0EjHQMeYgYtTAKb6xylGhiOPL15XX+lhMIP511e/E3+/bvq4/dD57pNa2k69Pev78+4wMlxuz2d
 32nDK+deq1I9q5caS9xtv/Ljc/eLDxOnHzyy/08wLAA==
X-Developer-Key: i=tamird@kernel.org; a=openpgp;
 fpr=5A6714204D41EC844C50273C19D6FF6092365380


On Wed, 03 Jun 2026 16:20:51 +0200, Malte Wechter wrote:
> rust-analyzer: update generate_rust_analyzer to pass cfg to macros crate

Applied, thanks!

[1/1] rust-analyzer: update generate_rust_analyzer to pass cfg to macros crate
      commit: 749daf28a5522af5cab92e8d3aea02c2cac2941f

Best regards,
-- 
Tamir Duberstein <tamird@kernel.org>

