Received: from pv50p00im-zteg10021301.me.com (pv50p00im-zteg10021301.me.com [17.58.6.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7ACC22B64B
	for <rust-for-linux@vger.kernel.org>; Fri, 25 Oct 2024 02:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=17.58.6.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729824014; cv=none; b=GYOrtE46kdeSTg0jcVswJ+l0Yia9P1Q8ZaJqcQALoLUrwKHj57jOOEaFMkE5HiCkyn9JZkQJSxPMbi2EbzgR6NmdN3Rlgd0Fc2yxH0OBGaLGg2wXbNKl6g9zlcFRkSrsTTl5JDgprPQZb3tzWEZLZ8b7sI4tItrEvTMICcF2vyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729824014; c=relaxed/simple;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	h=From:Content-Type:Mime-Version:Subject:Message-Id:Date:To; b=AoMjgP68874sgdRnEzYxP+8bvM3UcocYRh9fIJKRV3b1Q2HgBKgn4P2UulX66fyJO6SrVcdSJYqKLO5GmeaFJ4BzJmvN5T1pa83MwtFByjdPFf3G11tvP/TBEBzFX4J87vd9YfsPjprnhX+p8+55x//RA9Sb6fJn1kLM4jEtJjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=paige.bio; spf=pass smtp.mailfrom=paige.bio; dkim=pass (2048-bit key) header.d=paige.bio header.i=@paige.bio header.b=IxKHsUn+; arc=none smtp.client-ip=17.58.6.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=paige.bio
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paige.bio
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paige.bio header.i=@paige.bio header.b="IxKHsUn+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=paige.bio; s=sig1;
	t=1729824011; bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	h=From:Content-Type:Mime-Version:Subject:Message-Id:Date:To;
	b=IxKHsUn+KpFBwoUKp/a7HkUpmmq/Rp9gKneV5qSfd64Dxu/v+/LyZPCa/H05D3YIf
	 /9eTedAcht4Q0K5Qck7Bm+YJUGxYbp5+6/eFkl6q4HPK/tCxYHyh7Xa4Sm5TCMAf9J
	 HzGxmJ3lYR7FWyTy0S/2P5j06nddLD+B8SlnJhOvynY7dtOU5ON5pHlfX8nChXJayg
	 oC6CkJbmJCb/iRBTN47nQpYv2N5+iM8kI7pX4llxkaUKtsn/k7Hs4exRAdWg78dHVi
	 960fIM6D823O5HpGZ/atsqqND9zbW2woWm34MhnboAo6RFUgg2JQLH4HbHRFArlTeK
	 +ZdUmTLDy6pKg==
Received: from smtpclient.apple (pv50p00im-dlb-asmtp-mailmevip.me.com [17.56.9.10])
	by pv50p00im-zteg10021301.me.com (Postfix) with ESMTPSA id B8110500125
	for <rust-for-linux@vger.kernel.org>; Fri, 25 Oct 2024 02:40:08 +0000 (UTC)
From: paige@paige.bio
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Reply-To: paige+rust-for-linux@paige.bio
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3818.100.11.1.3\))
Subject: 
Message-Id: <87513F94-4658-4E1D-AA12-B1A8A429FDBA@paige.bio>
Date: Thu, 24 Oct 2024 19:39:56 -0700
To: rust-for-linux@vger.kernel.org
X-Mailer: Apple Mail (2.3818.100.11.1.3)
X-Proofpoint-GUID: orNGIs-HaFhEfuwAmE6J4KUmHvk1ZQK4
X-Proofpoint-ORIG-GUID: orNGIs-HaFhEfuwAmE6J4KUmHvk1ZQK4
X-Proofpoint-Virus-Version:
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxscore=0
 mlxlogscore=424 clxscore=1030 phishscore=0 bulkscore=0 spamscore=0
 malwarescore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2308100000 definitions=main-2410250018

