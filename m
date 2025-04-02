Received: from sonic307-56.consmr.mail.ne1.yahoo.com (sonic307-56.consmr.mail.ne1.yahoo.com [66.163.190.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B292153BE
	for <rust-for-linux@vger.kernel.org>; Wed,  2 Apr 2025 10:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=66.163.190.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743590895; cv=none; b=VQCNb/s1hVQJLY3ikRQPDGnBswbEK98ZqWK6/98kkE786o4u3UOomE/dbRvfEEHsF+KMyiebeK7hlDOsk9YhmbTe3FnR7lalKxdBShNpCEWOIVdgSSwnuJT3xYN2GbJ/O6mBVlZoiFGDgDT7H8CwCeyz7YR9G9IFXbXHczokeKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743590895; c=relaxed/simple;
	bh=r1llOjGIJc8zkCidXQgbQ9A2BwndvNSpZvH6yLCRpZQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 References; b=llu8jAQEr44rYsFt2R/e3nmSv+l3byU+znYE/mVFjTMXrI2X9sT2WBgqbIIyPOF4R4Sp32iS0rhMpLTXx+apJqkQOfySFieTQl+PAAvjyoK9o52RQV47TMJr4u+pBrfowMerYcvmlbGZyQvAsQQLh4P/7n6nhLhx7ogAwckBipE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com; spf=pass smtp.mailfrom=yahoo.com; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=SGqIXRqc; arc=none smtp.client-ip=66.163.190.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="SGqIXRqc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1743590887; bh=E5+xP7vKqvsvodXdKKmYt+3Gsw0sWP537VjtP/eZJew=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=SGqIXRqcWiJUPATh4torAM8XCnnO+fwQxoGrYfFFMXr6pYA8gsipjKd52AcWcnX+cEbjlm4HnSjM5zcx70+1FaOnCTXvl9upKBDsjDmDrNCeFsA7N/4KPRBHgvUFZH2VKVjW8whhAPXIXIzpU0TLtMlzMtAwtE4nYSy35mHJl+78wD1wKGkvfepQGmByStdyhMVKoiaQJ7oEJXEk7XIdMveCawAys7ShL3Jmc+6AZgkmmxvSB9BSkfc2M2DcHmLyLvN+JE+bKV8tMShklImNN0/uQSpTrWLUwy0QoqQdX7iXVBHerz+ixvDaHlXCZ2NPG6d4IFYsui0/4mxbWSoqkg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1743590887; bh=rX13GufWKHhba8BikHkfQD9+sW7hfXsy1A3VXn485vF=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=rNQrFa3gWxjO+SzWoM6RFmaclZ21gFzw/sh4ruw0PQmLH7s+vE7rVvOCtRVJPOThiY8hz6riuN8X+2AHS6m0uH/3WlG818cJqTvYChAyFdCKoxdseMIYLZERQTTVoilGOTCifU4hpJbAuJ6Q+z7yVzu0dHtQjlXraJKiNXDkkBhzR8uxGyG7iE5TeTcEOBVLvK56P/AFvFWlPp0/sHW2iEpiutUCvFuqz+PfyZnbiupfV24Ftsc9xo95xJcT8Uq1aVKdQXnZy9PQbViA6qebf60+ZK5rtCOwFGVBKwyYj1p4jxhN7dNeZXO0y6iyNHdSxwcbTF4YYEuigba3BwE7hg==
X-YMail-OSG: sgTTlFUVM1kbelKc_aVyFCDq0ri57xOpbezQ35erERhuTLjyg3m4afXc9ww1Imr
 Z5jM_yAofk.z.KLZrciWJxIyaDduvgvmTAIG8xYAg1EyUwwyeKITcE0trHHdI7.0VM4k9hBCCpWP
 VdFkm35wBlrEbyNOKQ_6xmbZkFepaV6Pzk0nEc_jdr8Ebhz8nexi70YCvJ1Bq73DxO_HIPz4Mcgs
 cIQjb8SHBbNiykF.BgoYJ5a.SOHYTe96i1mKDdUSYPOhEKH.QYsMl4VvMytrYIAv3NhgG9rXBEMX
 38jjq67vY_lqsx4QujYpZ9PDDQMeBENc_wxR.Y4zzSoigrm28P2.OpTmDRVJJKVBN3RPh7D79rQh
 CWsa4BoPdaegwrSvenNRLdBxK1yvHeP_mqsom7Ds_143S3DBxxVMx5zV45KRSgCNDEtPGvg_qso0
 XrmM3..cnVDiw3zNtvJGRB8tvmdH6cFky6vpnhSmVFTx3NsDkwk9sKFQXec9i1l7.nS_rSpd3aQa
 ubeFiQIvfY2EMyY4JqGkJGcJ08IWl6ZzN3A_qDrm7Hnmgx0o_rtvoBEVvQ6fN4oEJVlVlOTLTDPj
 PEchwGjCI_0ER0tznhKg5x.f.Y8.q3ykobUQldq.ut_xYEjE6k.J5jEq.BfzPDpnNNdfojLjtIeG
 FzbV7cXkc3DYtiEe7bGFtAu7Yh_gcA5nidfBEWouyShXPp7.s6EBjiNjP3g3D7Bwij98jN0Ki3Fv
 rWKmJ.9WvZoAa0OBaj8U6_zdkRZle_FtrIUAjC3bztmA1sQ4TXGRmPxWKeZMFhmetFrCIsy8X5x7
 uEJ_bO47RZnppd1J1XNmhkb7KJ_1sHdYGbSNXUr38WBgQIoZEzasyN9Htm5ZOpGv.yVj.hyD.02s
 sldCtIWGJyGP3GEIX7VIwpN2yY_4bS7skA4PfeEQYWtOjf2jwEK8LxY60TLWjSDVCti_fX2eFKxE
 XbS4tXf7PDd0jj2nh4bzVfxPxpQUBvkGrC4X2LpKeS2FInxtG8jka4LnSKPZ6k6SkMvfuuSznEYY
 ydVcdBaXLGM.WbjsjHg2Js2FU058lt6dCk5bAfN_JIZuwsKTMZ75OJ17Y1mxjhhEEh_3dIhNOpTa
 BIvSxZ75der.6R7rKNrLAgAST0OFdsfYKRfSkoA_Bbhs_zShGIGzJPYrNkIXtKdq2ejh9sBIsPBV
 X7nFsh.tqFcjh839trRsN5RHSq0SQaG3vK2omXVPG.GxKwJoYCpqH2OKD9ip8iET.yMQ.aDP.zUe
 g5DorSA2JHXnU062YieHV5LIEduTb5GK7.DZIfUW2wGSW6K2GRABYPRNokzzrnvzToahDenxalna
 RB.XwROnGnWFq28bQo3t4Nun0LkZ6O2DIUG1pOf4eIxHrRDvhSbJIMIVljxXY0TwN0CjoR7R4mtO
 zyB6VvHKVACqms6DYrFgHp3IDifVIRxvV_4kl.2y6Qp8k340BP5C9IWohQRwJCHevIEzhhzqFeop
 Jnc3gheVQ6mPq_K_zwK76teEm8DBkC_n5XYTb3nDU51kqLQZ.8ljNBEuMRo05hFav6yrbbJFP_Iq
 pDy1ZkWsoz5mu.OKmncy9aEjKse0OmuVnH_zWtzqri3VJCvxAVMoN7qK307pYv5hh1i8YqVWnhZt
 EKBYPcOY.LA7FbneR8VncGCrTQP1ajbkv3Zbv3gyPhMEUIyGcAgaCKCZLXALZMkMXOfrA3N3CZUO
 aRtLY7KwKWqnm9E0Gg.7mOh779fYhvSd8CnB0CVWe.QwRim9W0ODOkelf95mXutsaW6zq33z2kQ3
 dDegFBwJ42X.2GEAaY4SVJFCNW0bAX0QilU1znLfYr.vdX.QbClP52MZHyV7_I9iuBUVdKmKyI.M
 X_g7vS0UOOd7eudPN9_aEt1m2_01h.JClKhtYxbFppC_ynb19kvGeVKfgeWhAq2vMX6HyjKiVQbY
 q7EJbrKSn51QkDjhHwlJwzWZZfQV3qY3rNfB7CO2WTiai8d5W1nMybzOgCEHM1xSspk3Do2FEOXG
 Kn5CDA0qtrDx26akileFwRIyMhUgzXRxlroUEbiXYaHRUdEW0FIrLtURrviv7l089zWihtGMMwuJ
 9XweDgxGnsZXBPDanxuzg6tMBzY2CUTyOJy.nOhcQq58qV6eZTMNQWerbzFRni5YZNA4I4EDdmGD
 pw04eHG5fjrIPunKQPIXcjx2tmejjTW6aYE8oZS9C.5RjCYthtU8N9tu05iQeg28Jlg7_6T6k_0p
 MUbrAFXt3qm.fsnv.YsyIhzIo0rWFv8ae_hsIbrPpIfdwsJmjPVMw7xwZzNsoo3LSZtUEbKoqlQO
 5E2a1txX41.Ql
X-Sonic-MF: <igor.korotin@yahoo.com>
X-Sonic-ID: 8812ee10-fa29-4d68-b604-d4687fb15404
Received: from sonic.gate.mail.ne1.yahoo.com by sonic307.consmr.mail.ne1.yahoo.com with HTTP; Wed, 2 Apr 2025 10:48:07 +0000
Received: by hermes--production-ir2-54ff696c44-bxhf9 (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID d8a5a8653357f22c9d8d0643540c05e8;
          Wed, 02 Apr 2025 10:48:02 +0000 (UTC)
From: Igor Korotin <igor.korotin@yahoo.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	rust-for-linux@vger.kernel.org,
	Igor Korotin <igor.korotin@yahoo.com>
Subject: [PATCH v2] docs: rust: quick-start: update Ubuntu instructions
Date: Wed,  2 Apr 2025 11:47:59 +0100
Message-ID: <20250402104759.1764282-1-igor.korotin@yahoo.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
References: <20250402104759.1764282-1-igor.korotin.ref@yahoo.com>

Ubuntu’s rust-1.80 and bindgen-0.65 packages don't set their tools
as defaults. They should be defined explicitly.

Signed-off-by: Igor Korotin <igor.korotin@yahoo.com>
---

Changes since v1:
 - rewrote commit message to be more concise
 - reworked instruction's steps not to make global changes
 - added overall build command for Ubuntu.
 - https://lore.kernel.org/all/20250331170118.1376899-1-igor.korotin@yahoo.com/
 
 Documentation/rust/quick-start.rst | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/rust/quick-start.rst b/Documentation/rust/quick-start.rst
index 4aa50e5fcb8c..3651d726ede0 100644
--- a/Documentation/rust/quick-start.rst
+++ b/Documentation/rust/quick-start.rst
@@ -95,10 +95,25 @@ they should generally work out of the box, e.g.::
 
 	apt install rustc-1.80 rust-1.80-src bindgen-0.65 rustfmt-1.80 rust-1.80-clippy
 
+``PATH`` needs to be set when installing rust 1.80 with apt, e.g.::
+
+	PATH=/usr/lib/rust-1.80/bin:$PATH
+
+Deb package bindgen-0.65 does not set itself as a default, thus it should be set
+explicitly, e.g.::
+
+	BINDGEN=bindgen-0.65
+
 ``RUST_LIB_SRC`` needs to be set when using the versioned packages, e.g.::
 
 	RUST_LIB_SRC=/usr/src/rustc-$(rustc-1.80 --version | cut -d' ' -f2)/library
 
+The overall command should be the following::
+
+	make LLVM=1 PATH=/usr/lib/rust-1.80/bin:$PATH \
+		RUST_LIB_SRC=/usr/src/rustc-$(rustc-1.80 --version | cut -d' ' -f2)/library \
+		BINDGEN=bindgen-0.65 <target>
+
 In addition, ``bindgen-0.65`` is available in newer releases (24.04 LTS and
 24.10), but it may not be available in older ones (20.04 LTS and 22.04 LTS),
 thus ``bindgen`` may need to be built manually (please see below).
-- 
2.43.0

