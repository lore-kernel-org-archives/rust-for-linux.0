Received: from sonic314-20.consmr.mail.ne1.yahoo.com (sonic314-20.consmr.mail.ne1.yahoo.com [66.163.189.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35ECF210F5D
	for <rust-for-linux@vger.kernel.org>; Mon, 31 Mar 2025 17:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=66.163.189.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743440496; cv=none; b=KvpbLpcZ1THSLLZZPUjC/VHIxC6oGbH9AetKMCKePetc6f5N8hOzwswfC3MY3JVEoV0rtanv7oZAIms6mxC1Gt8wIe5FUsB6OIpEqdWW8ZIdozS53Tv8IQou/OpO4taxYt471W38iYVvU3L5MZstT4F8tvGoeopxhyr38rZCwK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743440496; c=relaxed/simple;
	bh=wIdFhuy/MLq9l0YLnF++nF2+gx9UnRaSYdBrk10mHF8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mCWRCg/2QQbXIUGFSMKvxbSCLxM+DKN5gf19WXduG8dZe85jE9atE8kTTPsLISE7mm2Vty/GrZtwLjig6w/+dEcmK3CyMPPKsYjp2DMQ7wL/mc/q5dfJ49i5EPFVOkXflIGAjwtblBh9178h9or55YsBoNPDOcROC4U3/ke47oY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com; spf=pass smtp.mailfrom=yahoo.com; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=udSXukvR; arc=none smtp.client-ip=66.163.189.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="udSXukvR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1743440494; bh=Php+99wtOZU5AZ9Br3oKzou/LEI0plMjziNPGzAjVeE=; h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To; b=udSXukvR39ZJL/nR7/vNYyqAbfPyvk6s2OU32RRw2oL0VbMyZP7WDkILGT+NyA4lJ/TvARv/tfTeIeQKA6unzCLiSxKbT1flxNxjyoNikpViqHoPG5Ijmv1voN9VV+/nPyC0Ha6ybibWPBsNfyFSSFxKD0gFkc5Q0qdtZnfbCEBJTmKymfmmUwI48qQIg4PjeqH/Uz6rNs/fE24Rj4uCzZjYa2aFm2EE0QTtxmhRQ/Td5GDu2IWXbi+t5nyAohXYqDi9O3+62ARZpDtHVwnS4bQkq1QgPTd6X8SkbBhRRi7oXd+LJSfon+Qb39Q4eMx1uPWAXilOE/xkkrG/XsQnXw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1743440494; bh=CJO8vx8mZzU7puyPN88DLXbdYYCPpvslLsTXlT5ql5o=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=odekL6YAEX/p33OGa2N44h0QDzOPY2rwHUyDsCfDxUzvnzvMrGQb/JD4gGrgnNHsTGcJCkcf3RoXa708UACF5O1JKt6YauLMO6R5Pg10UVg4e4rHerPwwOI9BQVCY52zGtqlBkN7iLKDnyE260OhWwQKPnrKbagItBvnA/bJxlT5Tucp4nLtpsYbNFk9kyOgkmEkRtEmmhrk8sq5ZlUz3DMjMAh/LZ/LcD4/hmGoOZ0oktd8UUD4hh3/nYCuxfTCuRlg9wjRywpf69RPBAX2C30EQDZcQ7YRnRwHHa+fxfo4jsOmy9Q+daxdLzhA4BrGqDkLbqiSesmbpCOT7c0YDA==
X-YMail-OSG: oFl_p_QVM1ke0SDaQwSu_viP7M8OLoCIdGZsV.HYQ4s74CsU8U0Dim3IvXemwS4
 8W91O2Q1mi39EjDeVOJ.Fez0B3KF.WQhG3u4ASNn0CZOewBeUDZavDln4KvmZ5Dsz1WCIANy1rk.
 QSDzsuQURN4FMcccLJvEfGdOhmrMtm08exUCZocsUdstenO_nVg_d9kVJ2uT_Nf7f7dYISU5pfgX
 ohLDw5qa8Y4k1arOTyISxGBVuj8l9UTKWK_.jO9xlB3.SokcgZWX7PRFh3Vv8hwBA5cGRTg1XDqb
 LQZLH_C6XRfvJMjrJX2cpeDV5zWVyCUfJ1imba3DZD84cDRrgDxwxAB1g2hPx_fWrOLonux1c3kZ
 dwlFxYiSl3wwevHyYRPtvGplq58J_zoEtIKNqjozM2i2dNm_3daYKx4tHHu4jiP3Bt_peL0cC8U2
 CVW.gYakgg.f6X5H4yxeoxBsRMNgtNv9aOCTRRr9NEQsa8t8U5owKCwgq1zMOaLokwChSsf_RCck
 m5EcvOhTIqLP_5izsZMWTaAdCapJzYacsrZxuk2YdfNHrEspVI9NzQ9zxH3tKHg5y.DbhQJAAb8e
 AweIQJpEhlRtqPv3nuonh5lPd2QfJaq9uq3to54xD1cssaYuupT6rRqzGc6_ROJRw2fvjRAQ4rKX
 wqPiD99z04O1LHAG.0t9Ev84M5k3QYevUS5TxkF1jFem8e3JjpoCEGRlHheeZIVI57Qg1.Hs1ZOS
 0z4X8V8pkE0ZEGW9anjTu0_qq3vNPzD5V1AWEFZU.wD0IDD01btjD4Ao1pj_tYmU0ahqFbn7issz
 GYFKo3ve40onp7bCPcg3Hx.QnPYa1DMYAG1BzoLMJCaIyILqNAfdrCdTZtMTxmQ7VHKGSfroU5zm
 6PkGVaEA17gO26qVx6iRa8FGuzO0X5HMBMuju3z3_OaPi0xug7r71RdCvhNwGnQWEGrvrNVg0mNH
 LQtUEUumxaoQxPgD9h4HXLaAKr9yMInzi6NadtULQi0d43.WFkJSa9ghq51OwJigAJcEAYRcv0Q.
 3y1TGf2FIHCWD6FgHekWW1Sp2MVNKgw1SBnoG9PS0Z1cdoZPy4bsJI3tsDY3y_65GPu1tA9o9vKN
 wVt5NNTQlhx6C0QzBLMo22kYeaVYBYiSXHRR1upLzn3HDAjLskFkWBy2lMZ9ilXCiL3RmtDOqcm4
 Mx5SDDC5U5Hoc5ng6tYzijUspiXoVgyTO7R_p4w8hsOx5gzsO1NBRyXY4W8oWHbfp1Mcp79phVpD
 qW4oitdzfatfCLmi6cevsvm7TWtUdbxMeoqsb6TOQ7Wuvj_v4_nYwB0obFsJ7p7vDEVCvqbLvlYK
 _7VmcbV3n8TP8aYnPRjAUcOREEiZiuvsQ3h6WeCsc6cfvtmoySc4nZ_hArPimbm0HmyBCBdkWQ1.
 fT6cxb.GgxJXRdj7jlgCRMlIwDt0tsGdH0L.nHXrIyGAut.UQzi3iwEGSaaskcZGPsBHc_55dD46
 _icAqDrG0pSaziRtAAkYSeXnP15LqsCpbUD1LRk43IhF2B03MXDc5qIjJfsWv5g3tKXGrZoEAkIW
 .lDKniu0YKnR5mns5NjkDqTcKCxDXX8Zob9BDsIbvIbk7dD8PCqgKl6ilamgmDe.Aamupp6vRBKF
 XrRDZHqhQXZEQOh2jN1fWM1An26AD5AZBUxBhdYoqIpWUS_VxM2kq3MCEZ74m85oIWXzz7dhNZZr
 C8HhCoweZKaF6bSPqSIi5vM.ROzbIzqbA8UZETJTRhaXSO7_7IKOmEFnjvpZR2s.39x8fv7G6A.w
 tnSy3WDyYYnCfLEa1AJP1uzdjeb81brPHMaWasNmzhT0bAu2d.8JoNeSr23JAHOZFSe4Ptq8FF1B
 Or9eAgJTUD.jOiGDPnz6eAlkPNTwAJST5yH0RPaWNUasMWzD65Y301Gu1espst6VlKn4Ips.GPOE
 uGNiXXOD3fjQbVP2z6HsULYc9CduIWBKfaOOqYLC88KxBRulvBMlKEbdGlB4cVtU1N9aivKxyd0u
 UL0Trtm4Geq9EVSWkrf9MySJVUG93sc4veio78iptp5MTGrOt09GHUORCNkke23foe0SN_XDKsR4
 O2hUv5hfxzWN8b_i8v7jSSqVP65suENgmtkjnDAPJuLHcpXGs5TdmM3e50N2JZKTydfQhXbkx80O
 wMlktxgmf0wSEWl0jsZoZBZarF4Mnvnqzppr43g5eWTaUiGqKN_ofDTyw8c5ZiZ1zZff9Dtufp42
 Y4Fegvt09eHzrPGX4EXBNFM55TC0SnrWcBYHC97geBVMnu.XDHihckDwkMbab8pwFLVTLdK5jI7l
 s23H4vP6F0Xr5JntFRw--
X-Sonic-MF: <igor.korotin@yahoo.com>
X-Sonic-ID: 6a5cd11b-fa38-4e0d-8cf0-db69a5a07bc9
Received: from sonic.gate.mail.ne1.yahoo.com by sonic314.consmr.mail.ne1.yahoo.com with HTTP; Mon, 31 Mar 2025 17:01:34 +0000
Received: by hermes--production-ir2-54ff696c44-4h45j (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 38a5781db54de714ebcab65f4fb62dc5;
          Mon, 31 Mar 2025 17:01:28 +0000 (UTC)
From: Igor Korotin <igor.korotin@yahoo.com>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>
Cc: Benno Lossin <benno.lossin@proton.me>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	rust-for-linux@vger.kernel.org,
	Igor Korotin <igor.korotin@yahoo.com>
Subject: [PATCH] docs: rust: quick-start: update Ubuntu instructions
Date: Mon, 31 Mar 2025 18:01:18 +0100
Message-ID: <20250331170118.1376899-1-igor.korotin@yahoo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <D8S8C5W0FCVD.1LH1E86H6PXZD@proton.me>
References: <D8S8C5W0FCVD.1LH1E86H6PXZD@proton.me>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Ubuntu’s rust-1.80 packages don't install tools by default, so the
PATH must include /usr/lib/rust-1.80/bin. Also, bindgen-0.65 needs
update-alternatives to set it as the default.

Signed-off-by: Igor Korotin <igor.korotin@yahoo.com>
---
 Documentation/rust/quick-start.rst | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/rust/quick-start.rst b/Documentation/rust/quick-start.rst
index 4aa50e5fcb8c..2846fd873680 100644
--- a/Documentation/rust/quick-start.rst
+++ b/Documentation/rust/quick-start.rst
@@ -95,6 +95,16 @@ they should generally work out of the box, e.g.::
 
 	apt install rustc-1.80 rust-1.80-src bindgen-0.65 rustfmt-1.80 rust-1.80-clippy
 
+By default bindgen-0.65 deb package does not set itself as default. It should be
+installed as an alternative:
+
+	update-alternatives --install /usr/bin/bindgen bindgen /usr/bin/bindgen-0.65 100
+	update-alternatives --set bindgen /usr/bin/bindgen-0.65
+
+``PATH`` needs to be set when installing rust with apt, e.g.::
+
+	PATH=/usr/lib/rust-1.80/bin:$PATH
+
 ``RUST_LIB_SRC`` needs to be set when using the versioned packages, e.g.::
 
 	RUST_LIB_SRC=/usr/src/rustc-$(rustc-1.80 --version | cut -d' ' -f2)/library
-- 
2.43.0

